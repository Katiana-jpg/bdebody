import 'dart:convert';
import 'dart:math';

import 'package:bdebody/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'entrainement.dart';
import 'exercice.dart';
import 'menu/graphiquePoids.dart';
import 'methodesHTTP.dart';

class Connexion extends StatefulWidget {
  Connexion({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ConnexionState();
}

class ConnexionState extends State<Connexion> {
  

  final _formKey = GlobalKey<FormState>();
  String courriel;
  String mdp;
  @override
  Widget build(BuildContext context) {
    
    utilisateur.isConnected =false;
    final emailField = TextField(
      obscureText: false,
      onChanged: (str) {
        courriel = str;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Courriel",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      obscureText: true,
      onChanged: (str) {
        mdp = str;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Mot de passe",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.yellowAccent[700],
      child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          splashColor: Colors.green,
          onPressed: () {
            postLogin();
            if(utilisateur.isConnected){
              
            getUserData();
            getObjectif();
            getUserExercices();
            getDonneesPoids();
            getDispos();
             Navigator.pushNamed(context, '/home'); 
             
            } 
            
          },
          child: Text(
            "Se Connecter",
            textAlign: TextAlign.center,
          )),
    );
    final bouttonPremiereUtilisation = FlatButton(
      onPressed: () {
        
        Navigator.pushNamed(context, '/premiereUtilisationPage1');
        
      },
      child: Text(
        "Première Utilisation ?",
        style: TextStyle(decoration: TextDecoration.underline,),
      ),
    );

    return WillPopScope(
      onWillPop: () async => false,
          child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
              child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox( 
                        height: 155.0,
                        child: Image.asset(
                          "assets/logo.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 45.0),
                      emailField,
                      SizedBox(height: 25.0),
                      passwordField,
                      SizedBox(
                        height: 35.0,
                      ),
                      loginButon,
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          bouttonPremiereUtilisation,
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ))),
    );
  }

void postLogin() async {
    String url = 'http://192.168.2.14:8080/login';
    print('log1');

    String body = json
        .encode({"courriel": courriel, "password": mdp});
    Response response = await post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    
    
     

    //Récupère une liste de ligne de donnée
 
  print(response.body);

  //Recupère le la réponse du server
  Map<String, dynamic> map = jsonDecode(response.body);
  //userData.elementAt(0);
  print(map);
  
  //Détermine si la connexion a fonctionné (mot de passe et courriel correspondent)
  utilisateur.isConnected = map["connected"];
  
    utilisateur.courriel= courriel;
    utilisateur.motDePasse= mdp;
  
  }}

  


