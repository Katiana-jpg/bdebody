import 'package:flutter/material.dart';

import '../utilisateur.dart';

/**
 * Onglet calendrier de l'application
 */
class Accueil extends StatefulWidget {
  Accueil({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AccueilState();
}
/**
 *Crée une instance de calendrier et l'affiche par semaine
 */
class AccueilState extends State<Accueil> {
Utilisateur utilisateur = new Utilisateur(nom : 'marc', age: '17', taille: '100', poids: '69', courriel: 'marcantoine@yahoo.com', motDePasse: 'marc', genre: 'Male');
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
              utilisateur.nom = str;
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
              utilisateur.age = (str);
            
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
              utilisateur.poids = (str);
            },
          ),
        ),
      ),
      SizedBox(height: 50),
    ])));
  }
}