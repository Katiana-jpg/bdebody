import 'dart:convert';
import 'dart:math';

import 'package:bdebody/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'entrainement.dart';
import 'exercice.dart';
import 'menu/graphique2.dart';

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
        
        Navigator.pushNamed(context, '/premiereUtilisationPage4');
        
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
  
  }


    ///Recupérer les données personnelles de l'utilisateur depuis la base de données
void getUserData() async {
  String url = "http://192.168.2.14:8080/get-user-data/";
  Response response = await post(url, body:{
    "courriel" : utilisateur.courriel,
    "password" : utilisateur.motDePasse,
    
  });
  
  print(response.body);

  //Récupère une liste de lignes de données
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
  
  
}

///Récupère les exercices des entrainements de l'utilisateur depuis la base de données
void getUserExercices() async {

String url1 = "http://192.168.2.14:8080/get-user-exercices/";
await getEntrainements();
Response responseExercices = await post(url1, body:{
    "courriel" : utilisateur.courriel,
    "password" : utilisateur.motDePasse,
    
  });

 //Récupère une liste de lignes de données d'exercices
  List<dynamic> userExercices = jsonDecode(responseExercices.body);
  
  //Ajoute les exercices de la base de données aux entrainements de l'utilisateur
  utilisateur.listeEntrainements.forEach((entrainement){

  userExercices.forEach((exercice){
    
    if(exercice['entrainement'] == entrainement.nomEntrainement){
      entrainement.exercices.add(new Exercice(nom:exercice['nom'], nbreRepetition: exercice['repetitions'], duree: exercice['duree'], description: exercice['description'], intensite: "intensite"));
    }

  });
});
}

}

///Récupère les entrainements de l'utilisateur depuis la base de données
Future getEntrainements() async {
String url1 = "http://192.168.2.14:8080/get-entrainements/";

Response responseEntrainements = await post(url1, body:{
    "courriel" : utilisateur.courriel,
    "password" : utilisateur.motDePasse,
    
  });

 //Récupère une liste de ligne de donnée
  List<dynamic> userEntrainements = jsonDecode(responseEntrainements.body);
  utilisateur.listeEntrainements.clear();
  //ajoute les entrainement de la db à l'utilisateur
  userEntrainements.forEach((entrainement){
    utilisateur.listeEntrainements.add(new Entrainement(nomEntrainement: entrainement['nom'], intensite: entrainement['intensite'], exercices: new List<Exercice>()));
  });

}

///Récupère l'objectif SMART de l'utilisateur depuis la base de données
void getObjectif() async {
String url = "http://192.168.2.14:8080/get-user-objectif/";
Response responseObjectif = await post(url, body : {
    "courriel" : utilisateur.courriel,
    "password" : utilisateur.motDePasse, 
  });

//Récupère le body de la réponse du server dans une variable de type Map
Map<String, dynamic> objectif = jsonDecode(responseObjectif.body);
print(objectif);

//Défini les valeurs de l'objectif de l'utilisateur en fonction de ce qui a été récupéré dans la base de données
utilisateur.objectifUtilisateur.poids = objectif['poidsCible'].toString();
utilisateur.objectifUtilisateur.date = DateTime.parse(objectif['date']);
utilisateur.objectifUtilisateur.objectif = objectif['objectif'];
}


