import 'dart:convert';

import 'package:bdebody/CreationCompte/premiereUtilisationPage2.dart';
import 'package:bdebody/heureDisponible.dart';
import 'package:bdebody/utilisateur.dart';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:http/http.dart';

import 'package:bdebody/main.dart';

import 'graphiquePoids.dart';

//import '../utilisateur.dart';

class MenuProfil extends StatefulWidget {
  // Map data = utilisateur.toMap();
  MenuProfil({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => MenuProfilState();
}

class MenuProfilState extends State<MenuProfil> {
  final GlobalKey<FormState> _validationNom = GlobalKey<FormState>();
  final GlobalKey<FormState> _validationPoids = GlobalKey<FormState>();
  final GlobalKey<FormState> _validationTaille = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _poids;
  String _taille;
  String _nomUtilisateur;
  DateTime dateNaissance;
  int dateNaissanceMois;
  int dateNaissanceAnnee;
  int dateNaissanceJour;
  int genre = 1;
  Map data = utilisateur.toMap();

  ///Affiche un une boite de dialogue pour changer la valeur d'une donnée
  modifNom(BuildContext context) {
    // set up the buttons
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () async {
        _validateNom();
        // putUserData();
      },
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Entrez votre nouveau nom"),
          content: Form(
              key: _validationNom,
              autovalidate: _autoValidate,
              child: TextFormField(
                validator: validationNomUtilisateur,
                onChanged: (str) {
                  _nomUtilisateur = str;
                },
              )),
          actions: [
            okButton,
          ],
        );
      },
    );
  }

  String validationNomUtilisateur(String valeurNomUtilisateur) {
    if (valeurNomUtilisateur.length < 3) {
      return 'Le nom doit avoir au moins 2 caractère';
    } else
      return null;
  }

  void _validateNom() {
    if (_validationNom.currentState.validate()) {
      setState(() {
        _validationNom.currentState.save();
        utilisateur.nom = _nomUtilisateur;

        data = utilisateur.toMap();
        Navigator.of(context).pop();
        Scaffold.of(context).showSnackBar(SnackBar(
          content:
              Text("Donnée mise à jour", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.green,
        ));
      });
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  modifPoids(BuildContext context) {
    // set up the buttons
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () async {
        _validatePoids();
        // putUserData();
      },
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Entrez votre Poids actuel"),
          content: Form(
              key: _validationPoids,
              autovalidate: _autoValidate,
              child: TextFormField(
                keyboardType: TextInputType.number,
                validator: poidsValidation,
                onChanged: (str) {
                  _poids = str;
                },
              )),
          actions: [
            okButton,
          ],
        );
      },
    );
  }

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

  void _validatePoids() {
    if (_validationPoids.currentState.validate()) {
      setState(() {
        _validationPoids.currentState.save();
        utilisateur.poids = _poids;
        utilisateur.listePoids.add(double.parse(_poids));
        utilisateur.listeDate.add(DateTime.now());
        utilisateur.calculerIMC();
        data = utilisateur.toMap();
        Navigator.of(context).pop();
        Scaffold.of(context).showSnackBar(SnackBar(
          content:
              Text("Donnée mise à jour", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.green,
        ));
      });
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  modifTaille(BuildContext context) {
    // set up the buttons
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () async {
        _validateTaille();
        // putUserData();
      },
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Entrez votre Taille actuel"),
          content: Form(
              key: _validationTaille,
              autovalidate: _autoValidate,
              child: TextFormField(
                keyboardType: TextInputType.number,
                validator: tailleValidation,
                onChanged: (str) {
                  _taille = str;
                },
              )),
          actions: [
            okButton,
          ],
        );
      },
    );
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

  void _validateTaille() {
    if (_validationTaille.currentState.validate()) {
      setState(() {
        _validationTaille.currentState.save();
        utilisateur.taille = _taille;
        utilisateur.calculerIMC();
        data = utilisateur.toMap();
        Navigator.of(context).pop();
        Scaffold.of(context).showSnackBar(SnackBar(
          content:
              Text("Donnée mise à jour", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.green,
        ));
      });
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  sexe(int sexe) {
    return (sexe == 1) ? 'Homme' : 'Femme';
  }

  modifGenre(BuildContext context) {
    // set up the buttons
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () async {
        setState(() {
          utilisateur.genre = sexe(genre);

          data = utilisateur.toMap();
          Navigator.of(context).pop();
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Donnée mise à jour",
                style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.green,
          ));
        });

        // putUserData();
      },
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Entrez votre Sexe actuel"),
          content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
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
                    child: Text(
                      "Homme",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black),
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
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            );
          }),
          actions: [
            okButton,
          ],
        );
      },
    );
  }

  modifAge(BuildContext context) {
    // set up the buttons
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () async {
        if (dateNaissanceAnnee != null) {
          setState(() {
            utilisateur.age = calculateAge(dateNaissance);
            data = utilisateur.toMap();
            Navigator.of(context).pop();
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("Donnée mise à jour",
                  style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.green,
            ));
          });
        }
        // putUserData();
      },
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Entrez votre Date de naissance"),
          content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        'Date de naissance',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(width: 40),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32.0),
                        color: Colors.black,
                      ),
                      child: IconButton(
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
                        // decoration: BoxDecoration(
                        //   border: Border.all(color: Colors.grey[900]),
                        // ),
                        child: Text(
                          (dateNaissance == null)
                              ? ''
                              : '$dateNaissanceAnnee/$dateNaissanceMois/$dateNaissanceJour',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ]),
            );
          }),
          actions: [
            okButton,
          ],
        );
      },
    );
  }

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // child:SingleChildScrollView(
      child: Scaffold(
        body: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30),
            Center(
              child: Text(
                'PROFIL',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 40),
            Row(children: <Widget>[
              Expanded(
                child: Center(
                  child: Text(
                    'NOM',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Center(
                  child: Text(
                    'SEXE',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              )
            ]),
            SizedBox(height: 10),
            Row(children: <Widget>[
              Expanded(
                child: MaterialButton(
                  child: Text(
                    utilisateur.nom,
                    style: TextStyle(
                      color: Colors.yellowAccent[700],
                      letterSpacing: 2.0,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {},
                  onLongPress: () {
                    modifNom(context);
                  },
                  elevation: 0,
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: MaterialButton(
                  child: Text(
                    utilisateur.genre,
                    style: TextStyle(
                      color: Colors.yellowAccent[700],
                      letterSpacing: 2.0,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {},
                  onLongPress: () {
                    modifGenre(context);
                  },
                  elevation: 0,
                ),
              )
            ]),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Text(
                      'AGE',
                      style: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Center(
                    child: Text(
                      'POIDS',
                      style: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    child: Text(
                      utilisateur.age,
                      style: TextStyle(
                        color: Colors.yellowAccent[700],
                        letterSpacing: 2.0,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {},
                    onLongPress: () {
                      modifAge(context);
                    },
                    elevation: 0,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: MaterialButton(
                    child: Text(
                      utilisateur.poids + ' kg',
                      style: TextStyle(
                        color: Colors.yellowAccent[700],
                        letterSpacing: 2.0,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {},
                    onLongPress: () {
                      modifPoids(context);
                    },
                    elevation: 0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Text(
                      'TAILLE',
                      style: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Center(
                    child: Text(
                      'IMC',
                      style: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    child: Text(
                      utilisateur.taille + ' cm',
                      style: TextStyle(
                        color: Colors.yellowAccent[700],
                        letterSpacing: 2.0,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {},
                    onLongPress: () {
                      modifTaille(context);
                    },
                    elevation: 0,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Center(
                    child: Text(
                      utilisateur.imc,
                      style: TextStyle(
                        color: Colors.yellowAccent[700],
                        letterSpacing: 2.0,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Row(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Text(
                      'Objectif :',
                      style: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Center(
                      child: MaterialButton(
                    child: Text(
                      utilisateur.objectifUtilisateur.objectif,
                      style: TextStyle(
                        color: Colors.yellowAccent[700],
                        letterSpacing: 2.0,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {},
                    onLongPress: () {
                      Navigator.pushNamed(context, '/premiereUtilisationPage4');
                    },
                  )),
                ),
              ],
            ),
            SizedBox(height: 30),
            Center(
                child: MaterialButton(
              child: Text(
                'Disponibité',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {},
              onLongPress: () {
                Navigator.pushNamed(context, '/premiereUtilisationPage3_1');
              },
            )),
            Container(
                padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
                height: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    getTextWidgets(utilisateur.disponibiliteSemaine),
                    getTextWidgets2(utilisateur.disponibiliteSemaine),
                    getTextWidgets3(utilisateur.disponibiliteSemaine),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget getTextWidgets(List<HeureDisponible> strings) {
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < strings.length; i++) {
      list.add(new Container(
        child: Text(
          strings.elementAt(i).jour,
          style: TextStyle(color: Colors.black),
        ),
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      ));
    }
    return new Column(children: list);
  }

  Widget getTextWidgets2(List<HeureDisponible> strings) {
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < strings.length; i++) {
      list.add(new Container(
        child: Text(
          'Début :' + strings.elementAt(i).debut.toString().substring(10, 15),
          style: TextStyle(color: Colors.black),
        ),
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      ));
    }
    return new Column(children: list);
  }

  Widget getTextWidgets3(List<HeureDisponible> strings) {
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < strings.length; i++) {
      list.add(
        new Container(
          child: Text(
            'Fin :' + strings.elementAt(i).fin.toString().substring(10, 15),
            style: TextStyle(color: Colors.black),
          ),
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        ),
      );
    }
    return new Column(children: list);
  }
  ////Recupérer tableau données utilisateur depuis la base de donnée
//   void getUserData() async {
//     String url = "http://192.168.2.14:8080/user/" + utilisateur.nom + "/data";
//     Response response = await get(url);

//     print(response.body);
//     //Récupère une liste de ligne de donnée
//     List<dynamic> userData = jsonDecode(response.body);

//     //Recupère le dernier element de cette liste (le plus récent)
//     //pour assigner les valeurs qu'il contient aux paramètres de l'utilisateur
//     Map<String, dynamic> map = userData.elementAt(userData.length - 1);
//     print(map['prenom']);
//     utilisateur.nom = map['prenom'];
//     utilisateur.age = map['age'].toString();
//     utilisateur.poids = map['poids'].toString();
//     utilisateur.taille = map['taille'].toString();
//     utilisateur.genre = map['genre'].toString();

// //Met à jour les données affichés sur l'écran profil

//     setState(() {
//       this.data = utilisateur.toMap();
//     });

//   }
}
