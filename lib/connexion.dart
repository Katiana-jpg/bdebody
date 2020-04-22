import 'package:flutter/material.dart';

class Connexion extends StatefulWidget {
  Connexion({Key key}) : super(key: key);
 
  @override
  State<StatefulWidget> createState() => ConnexionState();
}

class ConnexionState extends State<Connexion> {
 

  //final _formKey = GlobalKey<FormState>();


  final _formKey = GlobalKey<FormState>();


  

  @override
  Widget build(BuildContext context) {
   final emailField = TextField(
          obscureText: false,
          
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Courriel",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        );
        final passwordField = TextField(
          obscureText: true,
          
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Mot de passe",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        );
        final loginButon = Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.yellowAccent,
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            child: Text("Se Connecter",
                textAlign: TextAlign.center,
            )
          ),
        );
        final bouttonPremiereUtilisation = FlatButton(
  onPressed: () {
    Navigator.pushReplacementNamed(context, '/deuxiemePage');
  },
  
  child: Text(
    "Première Utilisation",
  ),
);

        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child:SafeArea(
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
}