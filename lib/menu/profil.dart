import 'dart:convert';

import 'package:bdebody/CreationCompte/premiereUtilisationPage2.dart';
import 'package:bdebody/utilisateur.dart';

import 'package:flutter/material.dart';
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
  final GlobalKey<FormState> _validationdateNaissance = GlobalKey<FormState>();
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
    if (_validationNom.currentState.validate()) {
      setState(() {
        _validationNom.currentState.save();
        utilisateur.poids = _poids;
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
    if (_validationNom.currentState.validate()) {
      setState(() {
        _validationNom.currentState.save();
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
                    modifNom(context);
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
                      modifNom(context);
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
                    child: Text(
                      utilisateur.objectifUtilisateur.objectif,
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
          ],
        ),
      ),
    );
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
