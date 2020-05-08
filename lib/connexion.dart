import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Connexion extends StatefulWidget {
  Connexion({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ConnexionState();
}

class ConnexionState extends State<Connexion> {
  //final _formKey = GlobalKey<FormState>();

  final _formKey = GlobalKey<FormState>();
  String user;
  String mdp;
  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      obscureText: false,
      onChanged: (str){
        user = str;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Courriel",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      obscureText: true,
      onChanged: (str){
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
          onPressed: () {
            postLogin();
            Navigator.pushNamed(context, '/home');
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
        "Première Utilisation",
      ),
    );

    return Scaffold(
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
        )));
  }


void postLogin() async{
Future<Response> request = post("http://192.168.2.14:8080/login", body: jsonEncode('{"user": "'+ user +'", "password" :"'+ mdp +'"}'));
print(request );
}

}
