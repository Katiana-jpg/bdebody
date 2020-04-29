import 'dart:convert';

import 'package:bdebody/entrainement.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../main.dart';
import 'package:bdebody/connexion.dart';
class MenuEntrainements extends StatefulWidget {
  @override
  _MenuEntrainementsState createState() => _MenuEntrainementsState();
}

class _MenuEntrainementsState extends State<MenuEntrainements> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 30, 30, 100),
      child: Column(
        children: <Widget>[
          Text(
            'Entrainements',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black,
              letterSpacing: 2.0,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Expanded(
              child: RaisedButton(
            color: Colors.yellowAccent[700],
            elevation: 15,
            onPressed: () {
              
              if(utilisateur.listeEntrainements.isNotEmpty){
                Navigator.pushNamed(context, '/MenuEntrainementsActuels');
              }else{
                Scaffold.of(context).showSnackBar(SnackBar(content : Text("Vous n'avez aucun entrainement",style:TextStyle(color : Colors.white)), backgroundColor: Colors.red,));
              }
            },
            child: Row(children: <Widget>[
              SizedBox(width: 20),
              Icon(
                Icons.directions_run,
                color: Colors.black,
              ),
              SizedBox(width: 6),
              Text(
                'Entrainements actuels',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(25),
            ),
          )),
          SizedBox(height: 20),
          Expanded(
              child: RaisedButton(
            color: Colors.yellowAccent[700],
            elevation: 15,
            onPressed: () {
              
                Navigator.pushNamed(context, '/MenuChoisirTypeEntrainements');
              
              
            },
            child: Row(children: <Widget>[
              SizedBox(width: 20),
              Icon(
                Icons.add_circle,
                color: Colors.black,
              ),
              SizedBox(width: 6),
              Text(
                'Créer nouvel entraînement',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(25),
            ),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              RaisedButton(
                color: Colors.yellowAccent[700],
                onPressed: () {
                  getUserEntrainements();
                },
                child: new Icon(
                  Icons.update,
                  color: Colors.black,
                  size: 25.0,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  ////Recupérer tableau données utilisateur depuis la base de donnée
  void getUserEntrainements() async {
    Response response =
        await get("http://192.168.2.14:8080/user/yves/entrainements");
    //Récupère une liste de ligne de donnée
    print(response.body);
    List<dynamic> userData = jsonDecode(response.body);

    //Récupère tous les entrainements
    utilisateur.listeEntrainements.clear();
    userData.forEach((entrainement) {
      utilisateur.listeEntrainements
          .add(new Entrainement(nomEntrainement: entrainement['nom']));
      print(entrainement);
    });

    //log test

    print('log');
  }
}
