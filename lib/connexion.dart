import 'dart:convert';

import 'package:bdebody/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'entrainement.dart';

class Connexion extends StatefulWidget {
  Connexion({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ConnexionState();
}

class ConnexionState extends State<Connexion> {
  //final _formKey = GlobalKey<FormState>();

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
            getEntrainements();
             Navigator.pushNamed(context, '/home'); 
             
            }; 
            
          },
          child: Text(
            "Se Connecter",
            textAlign: TextAlign.center,
          )),
    );
    final bouttonPremiereUtilisation = FlatButton(
      onPressed: () {
        Navigator.pushNamed(context, '/premiereUtilisationSignUp');
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

// void postLogin() async{
// Future<Response> request = post("http://192.168.2.14:8080/login", body: jsonEncode('{"user": "'+ user +'", "password" :"'+ mdp +'"}'));
// print(request );
// }

  void postLogin() async {
    String url = 'http://192.168.2.14:8080/login';
    print('log1');

    // Map data = {
    //   'Test': 'Test successful',
    // };
    //encode Map to JSON
    //var body =

    //String body = json.encode(data);
    // String body = json.encode({
    //       "user": utilisateur.nom,
    //       "password" :utilisateur.motDePasse
    //     });
    String body = json
        .encode({"courriel": courriel, "password": mdp});
    Response response = await post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    // Map responseData = json.decode(response.body);
    
    // print(json.decode(response.body));
    // print('log2');
    
     

    //Récupère une liste de ligne de donnée
  //List<dynamic> userData = jsonDecode(response.body);
  print(response.body);
  //Recupère le dernier element de cette liste (le plus r écent)
  //pour assigner les valeurs qu'il contient aux paramètres de l'utilisateur
  Map<String, dynamic> map = jsonDecode(response.body);
  //userData.elementAt(0);
  print(map);
  // utilisateur.nom=map['nom'];
  // utilisateur.age=map['age'].toString();
  // utilisateur.poids=map['poids'].toString();
  // utilisateur.taille=map['taille'].toString();
  // utilisateur.genre=map['genre'].toString();
  utilisateur.isConnected = map["connected"];
  
    utilisateur.courriel= courriel;
    utilisateur.motDePasse= mdp;
  
  }


    //Recupérer tableau données utilisateur depuis la base de donnée
void getUserData() async {
  String url = "http://192.168.2.14:8080/get-user-data/";
  Response response = await post(url, body:{
    "courriel" : utilisateur.courriel,
    "password" : utilisateur.motDePasse,
    
  });
  
  print(response.body);
  //Récupère une liste de ligne de donnée
  List<dynamic> userData = jsonDecode(response.body);
  
  //Recupère le dernier element de cette liste (le plus récent)
  //pour assigner les valeurs qu'il contient aux paramètres de l'utilisateur
  Map<String, dynamic> map = userData.elementAt(userData.length-1);
  print(map['nom']);
  utilisateur.nom=map['nom'];
  utilisateur.age=map['age'].toString();
  utilisateur.poids=map['poids'].toString();
  utilisateur.taille=map['taille'].toString();
  utilisateur.genre=map['genre'].toString();
  utilisateur.calculerIMC();
  //this.data=utilisateur.toMap(); 
  
  //log test
  //print(map);
  print('Good response body'); 
  
}

void getEntrainements() async {
String url1 = "http://192.168.2.14:8080/get-entrainements/";
String url2 = "http://192.168.2.14:8080/get-user-data/";

Response responseEntrainements = await post(url1, body:{
    "courriel" : utilisateur.courriel,
    "password" : utilisateur.motDePasse,
    
  });
 //Récupère une liste de ligne de donnée
  List<dynamic> userEntrainements = jsonDecode(responseEntrainements.body);
  utilisateur.listeEntrainements.clear();
  //ajoute les entrainement de la db à l'utilisateur
  userEntrainements.forEach((entrainement){
    
    utilisateur.listeEntrainements.add(new Entrainement(nomEntrainement: entrainement['nom'], intensite: entrainement['intensite']));

  });

}

}
