import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart';

import '../main.dart';

class PremiereUtilisationSignUp extends StatefulWidget {
  PremiereUtilisationSignUp({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PremiereUtilisationSignUpState();
}

class PremiereUtilisationSignUpState extends State<PremiereUtilisationSignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _name;
  String _courriel;
  String _motDePasse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
         elevation : 0,
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
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
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
        margin: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Icon(Icons.person),
              ),
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
                    validator: validateName,
                    onSaved: (String val) {
                      _name = val;
                    },
                  )),
            ]),
            new SizedBox(
              height: 20.0,
            ),
            Row(children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Icon(Icons.email),
              ), //courriel
              SizedBox(
                  width: 300,
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        labelText: 'Courriel',
                        labelStyle:
                            TextStyle(fontSize: 10, color: Colors.yellow[700])),
                    keyboardType: TextInputType.emailAddress,
                    validator: validateEmail,
                    onSaved: (String val) {
                      _courriel = val;
                    },
                  )),
            ]),
            new SizedBox(
              height: 20.0,
            ),
            //mdp
            Row(children: <Widget>[
              Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Icon(Icons.lock)), //courriel
              SizedBox(
                width: 300,
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      labelText:
                          'Mot De Passe ',
                      labelStyle:
                          TextStyle(fontSize: 10, color: Colors.yellow[700])),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  validator: validatePassword,
                  onSaved: (String val) {
                    _motDePasse = val;
                  },
                ),
              )
            ]),
            new SizedBox(
              height: 60.0,
            ),
            new RaisedButton(
              color: Colors.yellow[700],
              onPressed: _validateInputs,
              child: new Text('Suivant'),
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
      return '''Entrer un Mot de Passe avec au moins :
1  lettre majuscule           
1  lettre minuscule
1  nombre
1  caractère spécial ''';
    } else {
      if (!regex.hasMatch(value))
        return '''Entrer un Mot de Passe avec au moins :
1  lettre majuscule           
1  lettre minuscule
1  nombre
1  caractère spécial ''';
      else
        return null;
    }
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      utilisateur.nom = _name;
      utilisateur.courriel = _courriel;
      utilisateur..motDePasse = _motDePasse;

      Navigator.pushReplacementNamed(context, '/poids');

//    If all data are correct then save data to out variables
/**********************************************/
      //  postCreateUser();
/***************************************************************** */
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }

  ///Calcul l'age de l'utlisateur en fonction de sa date de naissance

}

///Crée nouvel utilisateur dans la base de données
void postCreateUser() async {
  String url = 'http://192.168.2.14:8080/create-user';

  String body = json.encode({
    "password": utilisateur.motDePasse,
    "courriel": utilisateur.courriel,
    "nom": utilisateur.nom,
  });

  Response response = await post(url,
      headers: {"Content-Type": "application/json"}, body: body);
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
