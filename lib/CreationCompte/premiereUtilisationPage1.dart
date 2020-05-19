import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart';

import '../main.dart';

class PremiereUtilisationPage1 extends StatefulWidget {
  PremiereUtilisationPage1({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PremiereUtilisationPage1State();
}

class PremiereUtilisationPage1State extends State<PremiereUtilisationPage1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  
  String _courriel;
  String _motDePasse;
  bool motDePasseVisible;

  @override
  void initState() {
    
motDePasseVisible=false;
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
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: new Form(
              key: _formKey,
              autovalidate: _autoValidate,
              child: nomCourrielMotdePasse(),
            ),
          ),
        ),
      ),
    );
  }

  ///Formulaire a remplir pour prendre le nom d'Utilisateur, le courriel et le mot de passe
  Widget nomCourrielMotdePasse() {
    return Container(
      margin: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          


          Container(
            child: Row(children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Icon(Icons.email),
              ),

              ///Courriel
              Expanded(
                                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      labelText: 'Courriel',
                      labelStyle:
                          TextStyle(fontSize: 10, color: Colors.yellow[700])),
                  keyboardType: TextInputType.emailAddress,
                  validator: validationCourriel,
                  onSaved: (String valeurCourriel) {
                    _courriel = valeurCourriel;
                  },
                ),
              ),
            ]),
          ),
          new SizedBox(
            height: 20.0,
          ),
          Container(
            child: Row(children: <Widget>[
              Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Icon(Icons.lock)),

              ///MotDePasse
              Expanded(
                                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(icon: Icon(motDePasseVisible? Icons.visibility: Icons.visibility_off), onPressed: (){
                      setState(() {
                        motDePasseVisible=!motDePasseVisible;
                      });
                    }),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      labelText: 'Mot De Passe ',
                      labelStyle:
                          TextStyle(fontSize: 10, color: Colors.yellow[700])),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !motDePasseVisible,
                  validator: validationMotDePasse,
                  
                  onSaved: (String valeurMotDePasse) {
                    _motDePasse = valeurMotDePasse;
                  },
                ),
              )
            ]),
          ),
          new SizedBox(
            height: 60.0,
          ),
          new RaisedButton(
            color: Colors.yellow[700],
            onPressed: _validationDesDonneesEntree,
            child: new Text('Suivant'),
          )
        ],
      ),
    );
  }


  /// Verification du Courriel
  String validationCourriel(String valeurCourriel) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(valeurCourriel))
      return 'Entrer un courriel valide';
    else
      return null;
  }

  /// Verification du MotdePasse
  String validationMotDePasse(String valeurMotDePasse) {
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = new RegExp(pattern);
    print(valeurMotDePasse);
    if (!regex.hasMatch(valeurMotDePasse)) {
      return '''Entrer un Mot de Passe avec au moins :
8  caractères 
1  lettre majuscule           
1  lettre minuscule
1  nombre
1  caractère spécial ''';
    } else
      return null;
  }

  ///Verification pour voir si chaque valeur entree a ete validé
  void _validationDesDonneesEntree()  {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      
      utilisateur.courriel = _courriel;
      utilisateur.motDePasse = _motDePasse;
 //postCreateUser();
      Navigator.pushReplacementNamed(context, '/premiereUtilisationPage2');

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
}

///Crée nouvel utilisateur dans la base de données
// void postCreateUser() async {
//   String url = 'http://192.168.2.14:8080/create-user';

//   String body = json.encode({
//     "password": utilisateur.motDePasse,
//     "courriel": utilisateur.courriel,
    
//   });

//   Response response = await post(url,
//       headers: {"Content-Type": "application/json"}, body: body);
//   Map responseData = json.decode(response.body);
//   print(responseData);
// }

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
