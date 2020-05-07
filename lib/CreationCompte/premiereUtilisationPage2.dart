

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';


import '../main.dart';

class PremiereUtilisationPage2 extends StatefulWidget {
  PremiereUtilisationPage2({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PremiereUtilisationPage2State();
}

class PremiereUtilisationPage2State extends State<PremiereUtilisationPage2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _poids;
  String _taille;
  String _imc;
  String _nomUtilisateur;
  DateTime dateNaissance;
  int dateNaissanceMois;
  int dateNaissanceAnnee;
  int dateNaissanceJour;
  int genre = 1;

  String poidsValidation(String value) {
    if (value.length == 0) {
      return 'veuillez entrez un nombre';
    }
    final poids = num.tryParse(value);
    if (poids == null) {
      return 'veuillez entrez un nombre valide';
    } else if (poids < 34 || poids > 275) {
      return '''            veuillez entrez un poids 
      entre 34 et 275 kg''';
    }
    return null;
  }

  String tailleValidation(String value) {
    if (value.length == 0) {
      return 'veuillez entrez un nombre';
    }
    final taille = num.tryParse(value);
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
              Row(children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Icon(Icons.person),
            ),

            /// Nom d'utilisateur
            SizedBox(
                width: 300,
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      labelText: "Nom d'Utilisateur ",
                      labelStyle:
                          TextStyle(fontSize: 10, color: Colors.yellow[700])),
                  keyboardType: TextInputType.text,
                  validator: validationNomUtilisateur,
                  onSaved: (String valeurNom) {
                    _nomUtilisateur = valeurNom;
                  },
                )),
          ]),
          new SizedBox(
            height: 20.0,
          ),
              Row(
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
                    child: Text(
                      "Homme",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white),
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
                    child: Text(
                      "Femme",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              new SizedBox(
                height: 50.0,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Date de naissance',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(width: 40),
                    IconButton(
                      icon: Icon(Icons.calendar_today),
                      color: Colors.blue,
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(1900, 1, 1),
                            maxTime: DateTime(2020, 3, 9), onChanged: (date) {
                          print('change $date');
                        }, onConfirm: (date) {
                          setState(() {
                            dateNaissanceMois = date.month;
                            dateNaissance = date;
                            dateNaissanceAnnee = date.year;
                            dateNaissanceJour = date.day;
                            print('confirm $date');
                          });
                        }, currentTime: DateTime.now(), locale: LocaleType.fr);
                      },
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      width: 90,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[900]),
                      ),
                      child: Text(
                        (dateNaissance == null)
                            ? ''
                            : '$dateNaissanceAnnee/$dateNaissanceMois/$dateNaissanceJour',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.yellow[700]),
                      ),
                    ),
                  ]),
              new SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Poids',
                    style: TextStyle(color: Colors.white),
                  ),
                  LimitedBox(
                      maxWidth: 250,
                      child: Container(
                          padding: EdgeInsets.fromLTRB(40, 0, 20, 0),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            validator: poidsValidation,
                            keyboardType: TextInputType.number,
                            onChanged: (String str) {
                              _poids = str;
                            },
                          ))),
                  Text('kg', style: TextStyle(color: Colors.white)),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Taille',
                    style: TextStyle(color: Colors.white),
                  ),
                  LimitedBox(
                      maxWidth: 250,
                      child: Container(
                          padding: EdgeInsets.fromLTRB(40, 0, 20, 0),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            validator: tailleValidation,
                            keyboardType: TextInputType.number,
                            onChanged: (String str) {
                              _taille = str;
                            },
                          ))),
                  Text('cm', style: TextStyle(color: Colors.white)),
                ],
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
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Veuillez entrez une date de naissance",
                          style: TextStyle(color: Colors.white)),
                      backgroundColor: Colors.red,
                      duration: Duration( seconds: 1),
                    ));
                  } else {
                    _validateInputs();
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
  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _imc = ((double.parse(_poids) /
                  (double.parse(_taille) / 100 * double.parse(_taille) / 100))
              .abs())
          .toStringAsFixed(2);
      utilisateur.age = calculateAge(dateNaissance);
      utilisateur.poids = _poids;
      utilisateur.taille = _taille;
      utilisateur.imc = _imc;
      utilisateur.genre = sexe(genre);
      utilisateur.nom = _nomUtilisateur;
      Navigator.pushReplacementNamed(
        context,
        '/premiereUtilisationPage3_1',
      );

//    If all data are correct then save data to out variables
//    Envoie les donnée à la base de données
      // putUserData();
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
    return (sexe == 1) ? 'Male Alpha' : 'Femme';
  }
}

///Envoie les nouvelles valeurs à la base de données
//void putUserData() async {
// String url = 'http://192.168.2.14:8080/update-user-data';

// String body = json.encode({
//   "password": utilisateur.motDePasse,
//   "courriel": utilisateur.courriel,
//   "nom": utilisateur.nom,
//   "age": int.parse(utilisateur.age),
//  "taille": int.parse(utilisateur.taille),
//  "poids": double.parse(utilisateur.poids),
// "genre": utilisateur.genre
// });

// Response response =
//     await put(url, headers: {"Content-Type": "application/json"}, body: body);
//  Map responseData = json.decode(response.body);
//  print(responseData);
//}
