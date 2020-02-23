import 'package:flutter/material.dart';

import '../utilisateur.dart';

class MenuProfil extends StatefulWidget {
  MenuProfil({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MenuProfilState();
}

class MenuProfilState extends State<MenuProfil> {
    Utilisateur utilisateur = new Utilisateur('Karl Elie ', 'Hien', 17, 58, 1.81);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(children: <Widget>[
            Text(
              'NOM',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            )
          ]),
          SizedBox(height: 10),
          Text(
            utilisateur.prenom,
            style: TextStyle(
              color: Colors.lightBlueAccent,
              letterSpacing: 2.0,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          Text(
            'AGE',
            style: TextStyle(
              color: Colors.grey,
              letterSpacing: 2.0,
            ),
          ),
          SizedBox(height: 10),
          Text(
            utilisateur.age.toString(),
            style: TextStyle(
              color: Colors.lightBlueAccent,
              letterSpacing: 2.0,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          Text(
            'POIDS',
            style: TextStyle(
              color: Colors.grey,
              letterSpacing: 2.0,
            ),
          ),
          SizedBox(height: 10),
          Text(
            utilisateur.poids.toString() + ' kg',
            style: TextStyle(
              color: Colors.lightBlueAccent,
              letterSpacing: 2.0,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
