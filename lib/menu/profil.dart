
import 'dart:convert';

import 'package:bdebody/utilisateur.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:bdebody/main.dart';

//import '../utilisateur.dart';

class MenuProfil extends StatefulWidget {

 // Map data = utilisateur.toMap();
  MenuProfil({Key key, }) : super(key: key);


  @override
  State<StatefulWidget> createState() => MenuProfilState();
}


// ////Recupérer tableau données utilisateur depuis la base de donnée
// void getLogins() async {
//   Response response =
//       await get("http://192.168.2.14:8080/user/yves");
// //Met la réponse json dans un objet map
//   //Map data = jsonDecode(response.body);
//   print(response.body);
//   print('a');
// }

class MenuProfilState extends State<MenuProfil> {
  Map data = utilisateur.toMap();

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      // child:SingleChildScrollView(
      child: Scaffold(
        body: Column( 
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30),
            Text(
              'Profil',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            Row(
            children: <Widget>[
              
              Expanded(
                              child: Text(
                  'NOM',
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                              child: Text(
                  'Sexe',
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2.0,
                  ),
                ),
              )
            ]),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
              Expanded(
                child: Text(
                utilisateur.nom,
                style: TextStyle(
                  color: Colors.yellowAccent[700],
                  letterSpacing: 2.0,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
            ),
              ),
              SizedBox(width: 20),
            Expanded(
                          child: Text(
                utilisateur.genre,
                style: TextStyle(
                  color: Colors.yellowAccent[700],
                  letterSpacing: 2.0,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )]),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'AGE',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Text(
                    'POIDS',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    utilisateur.age,
                    style: TextStyle(
                      color: Colors.yellowAccent[700],
                      letterSpacing: 2.0,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Text(
                    utilisateur.poids + ' kg',
                    style: TextStyle(
                      color: Colors.yellowAccent[700],
                      letterSpacing: 2.0,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'TAILLE',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Text(
                    'IMC',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    utilisateur.taille + ' cm',
                    style: TextStyle(
                      color: Colors.yellowAccent[700],
                      letterSpacing: 2.0,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
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
              ],
            ),
            SizedBox(height: 40),

Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                   'Objectif :',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2.0,
                     
                     
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
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
              ],
            ),

            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[

                RaisedButton(
                  color: Colors.yellowAccent[700],
                  onPressed: () {
                    Navigator.pushNamed(context, '/premiereUtilisation');
                  },
                  child: new Icon(
                    Icons.edit,
                    color: Colors.black,
                    size: 25.0,
                  

                  ),)
                ],
              ),
            ],
          ),

        ),
      
    );
    
  }

  ////Recupérer tableau données utilisateur depuis la base de donnée
void getUserData() async {
  Response response = await get("http://192.168.2.14:8080/user/yves/data");
  //Récupère une liste de ligne de donnée
  List<dynamic> userData = jsonDecode(response.body);
  
  //Recupère le dernier element de cette liste (le plus récent)
  //pour assigner les valeurs qu'il contient aux paramètres de l'utilisateur
  Map<String, dynamic> map = userData.elementAt(userData.length-1);
  print(map['prenom']);
  utilisateur.nom=map['prenom'];
  utilisateur.age=map['age'].toString();
  utilisateur.poids=map['poids'].toString();
  utilisateur.taille=map['taille'].toString();
  utilisateur.genre=map['genre'].toString();
  
  this.data=utilisateur.toMap(); 
  
  //log test
  print(map);
  print('log'); 
}
}


