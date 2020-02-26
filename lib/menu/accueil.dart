import 'package:flutter/material.dart';

import '../utilisateur.dart';


class Accueil extends StatefulWidget {
  Accueil({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AccueilState();
}

class AccueilState extends State<Accueil> {
  Utilisateur utilisateur = new Utilisateur('Marc Antoine ', 'Hien', 17, 59, 181);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: <Widget>[
      Expanded(
        flex: 1,
        child: Container(
          color: Colors.yellowAccent,
          padding: EdgeInsets.all(20),
          child: TextField(
            decoration: InputDecoration(hintText: 'Entrez votre nom...'),
            onChanged: (String str) {
              utilisateur.prenom = str;
            },
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(
          
          color: Colors.yellowAccent[400],
          padding: EdgeInsets.all(20),
          child: TextField(
            decoration: InputDecoration(hintText: 'Entrez votre âge...'),
            onChanged: (String str) {
              utilisateur.age = int.parse(str);
            
            },
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(
          color: Colors.yellowAccent[700],
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(hintText: 'Entrez votre poids...'),
            onChanged: (String str) {
              utilisateur.poids = double.parse(str);
            },
          ),
        ),
      ),
      SizedBox(height: 50),
    ])));
  }
}