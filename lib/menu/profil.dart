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
  Map data = utilisateur.toMap();

///Affiche un une boite de dialogue pour changer la valeur d'une donnée
showAlertDialog(BuildContext context, String donnee) {
      // set up the buttons
      
      Widget okButton = FlatButton(
        child: Text("OK"),
        onPressed: () async {
          putUserData();
          
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Donnée mise à jour",
                style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.green,
          ));

          Navigator.of(context).pop();
          setState(() {
            //recalcule l'IMC et met à jour les données
            utilisateur.calculerIMC();
            data = utilisateur.toMap();
          });
          
        },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("Entrez la nouvelle donnée"),
        content: TextField(onChanged: (str){
          switch (donnee) {
            case "NOM" : utilisateur.nom = str; break;
            case "AGE" : utilisateur.age = str; break;
            case "TAILLE" : utilisateur.taille = str; break;
            case "POIDS" : utilisateur.poids = str; getDonneesPoids(); break;
            case "SEXE" : utilisateur.genre = str; break;
            default:
          }
        },
        ),
        actions: [
          okButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
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
                  ), onPressed: () {
                    Navigator.pushNamed(context, '/MenuChoixDispos');
                  },
                  onLongPress: (){
                  showAlertDialog(context, "NOM");
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
                  ),onPressed: () {},
                  onLongPress: (){
                  showAlertDialog(context, "SEXE");
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
                    ),onPressed: () {},
                  onLongPress: (){
                  showAlertDialog(context, "AGE");
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
                    ),onPressed: () {},
                  onLongPress: (){
                  showAlertDialog(context, "POIDS");
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
                    ),onPressed: () {},
                  onLongPress: (){
                  showAlertDialog(context, "TAILLE");
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
  void getUserData() async {
    String url = "http://"+host+":8080/user/" + utilisateur.nom + "/data";
    Response response = await get(url);

    print(response.body);
    //Récupère une liste de ligne de donnée
    List<dynamic> userData = jsonDecode(response.body);

    //Recupère le dernier element de cette liste (le plus récent)
    //pour assigner les valeurs qu'il contient aux paramètres de l'utilisateur
    Map<String, dynamic> map = userData.elementAt(userData.length - 1);
    print(map['prenom']);
    utilisateur.nom = map['prenom'];
    utilisateur.age = map['age'].toString();
    utilisateur.poids = map['poids'].toString();
    utilisateur.taille = map['taille'].toString();
    utilisateur.genre = map['genre'].toString();

//Met à jour les données affichés sur l'écran profil
    
    setState(() {
      this.data = utilisateur.toMap();
    });

  }
}
