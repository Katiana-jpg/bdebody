import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:http/http.dart';

import '../main.dart';

///Deuxième page de la première utilisation
class PremiereUtilisationPage2 extends StatefulWidget {
  PremiereUtilisationPage2({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PremiereUtilisationPage2State();
}

///Définit l'état d'une instance de [PremiereUtilisationPage2]
class PremiereUtilisationPage2State extends State<PremiereUtilisationPage2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  ///poids entré dans la zone de texte
  String _poids;

  ///taille entrée dans la zone de texte
  String _taille;

  ///imc de l'utilisateur
  String _imc;

  ///nom D'utilisateur entré dans la zone de texte
  String _nomUtilisateur;

  /// date de naissance entrée par l'utilisateur
  DateTime dateNaissance;

  /// mois de naissance de l'utilisateur
  int dateNaissanceMois;

  /// année de naissance de l'utilisateur
  int dateNaissanceAnnee;

  /// jour de naissance de l'utilisateur
  int dateNaissanceJour;

  /// genre de l'utilisateur (commence sur Homme)
  int genre = 1;

  /// Verification du poids,
  /// avec la valeur qu'on lui donne [valeurPoids]
  String poidsValidation(String valeurPoids) {
    if (valeurPoids.length == 0) {
      return 'veuillez entrez un nombre';
    }
    final poids = num.tryParse(valeurPoids);
    if (poids == null) {
      return 'veuillez entrez un nombre valide';
    } else if (poids < 34 || poids > 275) {
      return '''            veuillez entrez un poids 
      entre 34 et 275 kg''';
    }
    return null;
  }

  /// Verification de la taille,
  /// avec la valeur qu'on lui donne [valeurTaille]
  String tailleValidation(String valeurTaille) {
    if (valeurTaille.length == 0) {
      return 'veuillez entrez un nombre';
    }
    final taille = num.tryParse(valeurTaille);
    if (taille == null) {
      return 'veuillez entrez un nombre valide';
    } else if (taille < 145 || taille > 300) {
      return '''           veuillez entrez une taille 
            entre 145 et 300 cm''';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          elevation: 0,
          title: SizedBox(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/logo.png",
                      fit: BoxFit.fill,
                      height: 50,
                    ),
                    SizedBox(width: 20),
                    Text(
                      'Créer un compte',
                      style: TextStyle(fontSize: 20, wordSpacing: 6),
                    )
                  ]),
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.grey[800],
        ),
        body: Builder(
          builder: (context) => SafeArea(
              child: Center(
            child: SingleChildScrollView(
              child: new Container(
                margin: new EdgeInsets.all(15.0),
                child: new Form(
                  key: _formKey,
                  autovalidate: _autoValidate,
                  child: formUI(context),
                ),
              ),
            ),
          )),
        ));
  }

//Formulaire a remplir
  Widget formUI(context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15),
          child: new Column(
            children: <Widget>[
              Container(
                child: Row(children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Icon(Icons.person),
                  ),

                  /// Nom d'utilisateur
                  Container(
                      child: Expanded(
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          labelText: "Nom d'Utilisateur ",
                          labelStyle:
                              TextStyle(fontSize: 15, color: Colors.black)),
                      keyboardType: TextInputType.text,
                      validator: validationNomUtilisateur,
                      onSaved: (String valeurNom) {
                        _nomUtilisateur = valeurNom;
                      },
                    ),
                  )),
                ]),
              ),
              new SizedBox(
                height: 30.0,
              ),

              ///Genre
              Container(
                child: Text(
                  "Sexe",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: genre,
                      onChanged: (T) {
                        setState(() {
                          genre = T;
                          print(sexe(genre));
                        });
                      },
                    ),
                    SizedBox(
                      width: 18.0,
                    ),
                    Container(
                      width: 70.0,
                      child: Expanded(
                        child: Text(
                          "Homme",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Radio(
                      value: 2,
                      groupValue: genre,
                      onChanged: (T) {
                        setState(() {
                          genre = T;
                          print(sexe(genre));
                        });
                      },
                    ),
                    SizedBox(
                      width: 18.0,
                    ),
                    Container(
                      width: 70.0,
                      child: Expanded(
                        child: Text(
                          "Femme",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              new SizedBox(
                height: 30.0,
              ),

              ///Date de naissance
              Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Date de naissance',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 40),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32.0),
                          color: Colors.white,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.calendar_today),
                          color: Colors.blue,
                          onPressed: () {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                minTime: DateTime(1900, 1, 1),
                                maxTime: DateTime(2020, 3, 9),
                                onChanged: (date) {
                              print('change $date');
                            }, onConfirm: (date) {
                              setState(() {
                                dateNaissanceMois = date.month;
                                dateNaissance = date;
                                dateNaissanceAnnee = date.year;
                                dateNaissanceJour = date.day;
                                print('confirm $date');
                              });
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.fr);
                          },
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          width: 90,
                          child: Text(
                            (dateNaissance == null)
                                ? ''
                                : '$dateNaissanceAnnee/$dateNaissanceMois/$dateNaissanceJour',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ]),
              ),
              new SizedBox(
                height: 50.0,
              ),

              ///Poids
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Poids',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: LimitedBox(
                          maxWidth: 250,
                          child: Container(
                              padding: EdgeInsets.fromLTRB(40, 0, 20, 0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    // labelText: "Nom d'Utilisateur ",
                                    labelStyle: TextStyle(
                                        fontSize: 20, color: Colors.black)),
                                textAlign: TextAlign.center,
                                validator: poidsValidation,
                                keyboardType: TextInputType.number,
                                onChanged: (String str) {
                                  _poids = str;
                                },
                              ))),
                    ),
                    Text('kg', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              SizedBox(
                height: 50.0,
              ),

              ///Taille
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Taille',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: LimitedBox(
                        maxWidth: 250,
                        child: Container(
                            padding: EdgeInsets.fromLTRB(40, 0, 20, 0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  labelStyle: TextStyle(
                                      fontSize: 20, color: Colors.black)),
                              textAlign: TextAlign.center,
                              validator: tailleValidation,
                              keyboardType: TextInputType.number,
                              onChanged: (String str) {
                                _taille = str;
                              },
                            )),
                      ),
                    ),
                    Text('cm', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              new SizedBox(
                height: 10.0,
              ),
              new RaisedButton(
                color: Colors.yellow[700],
                onPressed: () {
                  if (dateNaissanceAnnee == null) {
                    /// Affiche une barre d'erreur lorsque la date de naissance n'est pas entrée
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Veuillez entrez une date de naissance",
                          style: TextStyle(color: Colors.white)),
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 1),
                    ));
                  } else {
                    _validationDesDonneesEntree();
                  }
                },
                child: new Text('Valider'),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Verification du nom d'Utilisateur
  String validationNomUtilisateur(String valeurNomUtilisateur) {
    if (valeurNomUtilisateur.length < 3)
      return 'Le nom doit avoir au moins 2 caractère';
    else
      return null;
  }
///Verification pour voir si chaque valeur entree a ete validé
  void _validationDesDonneesEntree() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _imc = ((double.parse(_poids) /
                  (double.parse(_taille) / 100 * double.parse(_taille) / 100))
              .abs())
          .toStringAsFixed(2);
      utilisateur.age = calculateAge(dateNaissance);
      utilisateur.poids = _poids;
      utilisateur.listePoids.add(double.parse(_poids));
      utilisateur.listeDate.add(DateTime.now());
      utilisateur.taille = _taille;
      utilisateur.imc = _imc;
      utilisateur.genre = sexe(genre);
      utilisateur.nom = _nomUtilisateur;
      Navigator.pushReplacementNamed(
        context,
        '/premiereUtilisationPage3_1',
      );
      // putUserData();

//    If all data are correct then save data to out variables
//    Envoie les donnée à la base de données
      putUserData();
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }

  ///Calcul l'age de l'utlisateur en fonction de sa date de naissance
  calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age.toString();
  }

  sexe(int sexe) {
    return (sexe == 1) ? 'Homme' : 'Femme';
  }
}

///Envoie les nouvelles valeurs des données de l'utilisateur à la base de données
void putUserData() async {
  String url = 'http://' + host + ':8080/update-user-data';

  String body = json.encode({
    "password": utilisateur.motDePasse,
    "courriel": utilisateur.courriel,
    "nom": utilisateur.nom,
    "age": int.parse(utilisateur.age),
    "taille": int.parse(utilisateur.taille),
    "poids": double.parse(utilisateur.poids),
    "genre": utilisateur.genre,
    "dateModification": DateTime.now().toString().substring(0, 10)
  });
  try {
    Response response = await put(url,
        headers: {"Content-Type": "application/json"}, body: body);

    Map responseData = json.decode(response.body);

//Log
    print(responseData);
  } catch (ClientException) {}
}
