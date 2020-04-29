import 'dart:convert';

import 'package:bdebody/utilisateur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:http/http.dart';
import 'package:bdebody/connexion.dart';
import '../../main.dart';

class PremiereUtilisationSignUp extends StatefulWidget {
  PremiereUtilisationSignUp({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PremiereUtilisationSignUpState();
}

class PremiereUtilisationSignUpState extends State<PremiereUtilisationSignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _poids;
  String _taille;
  String _name;
  String _courriel;
  String _motDePasse;
  String _imc;
  DateTime dateNaissance;
  int dateNaissanceMois;
  int dateNaissanceAnnee;
  int dateNaissanceJour;
  int genre = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent[700],
      body: SafeArea(
        child: SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
              key: _formKey,
              autovalidate: _autoValidate,
              child: formUI(),
            ),
          ),
        ),
      ),
    );
  }

//Formulaire a remplir
  Widget formUI() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(15),
        child: new Column(
          children: <Widget>[
            
            //courriel
            new TextFormField(
              decoration: const InputDecoration(labelText: 'Courriel'),
              keyboardType: TextInputType.emailAddress,
              validator: validateEmail,
              onSaved: (String val) {
                _courriel = val;
              },
            ),
            new SizedBox(
              height: 10.0,
            ),
            //mdp
            new TextFormField(
              decoration: const InputDecoration(
                  labelText:
                      'Mot De Passe ( Au moins 1 majuscule,1minuscule,1 nombre et 1 caractère spécial)',
                  labelStyle: TextStyle(fontSize: 10)),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              validator: validatePassword,
              onSaved: (String val) {
                _motDePasse = val;
              },
            ),
            
            new RaisedButton(
              onPressed: _validateInputs,
              child: new Text('Valider'),
            )
          ],
        ),
      ),
    );
  }

  String validateName(String value) {
    if (value.length < 3)
      return 'Le nom doit avoir au moins 2 caractère';
    else
      return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Entrer un courriel valide';
    else
      return null;
  }

  String validatePassword(String value) {
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = new RegExp(pattern);
    print(value);
    if (value.isEmpty) {
      return 'Entrer un Mot de Passe';
    } else {
      if (!regex.hasMatch(value))
        return 'Entrer un mot de passe valide';
      else
        return null;
    }
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      
      utilisateur.nom = _name;
      utilisateur.courriel = _courriel;
      utilisateur.motDePasse = _motDePasse;
      
      Navigator.pushReplacementNamed(
        context,
        '/premiereUtilisation',
        // arguments: {
        //   'nom': utilisateur.nom,
        //   'age': utilisateur.age,
        //   'courriel': utilisateur.courriel,
        //   'motDePasse': utilisateur.motDePasse,
        //   'poids': utilisateur.poids,
        //   'taille': utilisateur.taille,
        //   'imc': utilisateur.imc,
        //   'genre': utilisateur.genre
        // },
      );

//    If all data are correct then save data to out variables
postCreateUser();
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


///Crée nouvel utilisateur dans la base de données
  void postCreateUser() async {
String url = 'http://192.168.2.14:8080/create-user';

String body = json
        .encode({
          "password": utilisateur.motDePasse,
          "courriel": utilisateur.courriel,
          
          });

Response response = await post(url, headers: {"Content-Type": "application/json"},body: body);
Map responseData = json.decode(response.body);
print(responseData);
}

// ///Envoie les nouvelles valeurs à la base de données
//   void putUserData() async {
// String url = 'http://192.168.2.14:8080/update-user-data';

// String body = json
//         .encode({
//           "password": utilisateur.motDePasse,
//           "courriel": utilisateur.courriel,
//           "nom": utilisateur.nom,
//           "age": int.parse(utilisateur.age),
//           "taille": int.parse(utilisateur.taille),
//           "poids":double.parse(utilisateur.poids),
//           "genre": utilisateur.genre
//           });

// Response response = await put(url, headers: {"Content-Type": "application/json"},body: body);
// Map responseData = json.decode(response.body);
// print(responseData);
// }