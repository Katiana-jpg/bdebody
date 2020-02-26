import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

import '../utilisateur.dart';

class MenuProfil extends StatefulWidget {
  MenuProfil({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MenuProfilState();
}

class MenuProfilState extends State<MenuProfil> {
   Utilisateur utilisateur = new Utilisateur('Marc Antoine ', 'Hien', 17, 59, 181);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
              child: Container(
          child: Column(
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
                  color: Colors.yellowAccent[700],
                  letterSpacing: 2.0,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                      utilisateur.age.toString(),
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
                      utilisateur.poids.toString() + ' kg',
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
                      utilisateur.taille.toString() + ' cm',
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
                      utilisateur.imc.toStringAsFixed(2),
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
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(10),
                child: new Sparkline(
                  //data: [10,20,10,30],
                  data: utilisateur.listPoids,
                  lineColor: Colors.yellowAccent[700],
                  pointsMode: PointsMode.all,
                  pointSize: 8.0,)),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  
                  
                    RaisedButton(
                      color: Colors.yellowAccent[700],
                      onPressed: () {},
                      child: new Icon(
                        Icons.edit,
                        color: Colors.black,
                        size: 25.0,
                      ),
                      shape: new CircleBorder(),
                      elevation: 2.0,
                      //fillColor: Colors.white,
                      padding: const EdgeInsets.all(15.0),
                    ),
                  
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}