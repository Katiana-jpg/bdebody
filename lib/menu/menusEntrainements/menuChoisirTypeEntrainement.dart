import 'dart:convert';

import 'package:bdebody/main.dart';
import 'package:bdebody/utilisateur.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../entrainement.dart';
import '../../exercice.dart';

///Menu où l'utilisateur choisit le type d'entraînement qu'il veut créer
class MenuChoisirTypeEntrainements extends StatefulWidget {
  @override
  _MenuChoisirTypeEntrainementsState createState() =>
      _MenuChoisirTypeEntrainementsState();
}

///Définit l'état d'une instance de [MenuChoisirTypeEntrainements]
class _MenuChoisirTypeEntrainementsState
    extends State<MenuChoisirTypeEntrainements> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: false,
          //titleSpacing: 3.0,
          title: const Text(
            "Sélectionner un type d'entraînement",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.yellowAccent[700],
          elevation: 2.0,
        ),
        body: AnimatedContainer(
          margin: EdgeInsets.fromLTRB(20, 25, 20, 100),
          child: Column(
            children: <Widget>[
              //  Text('Entrainements',
              //    textAlign : TextAlign.left,

              //   style: TextStyle(
              //     color: Colors.black,
              //     letterSpacing: 2.0,
              //     fontSize: 28,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              SizedBox(height: 20),

              Expanded(
                  child: RaisedButton(
                color: Colors.yellowAccent[700],
                elevation: 15,
                onPressed: () {
                  Navigator.pushNamed(context, '/MenuChoixDispos');
                },
                child: Row(children: <Widget>[
                  SizedBox(width: 20),
                  Icon(
                    Icons.fitness_center,
                    color: Colors.black,
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Musculation',
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 2.0,
                      fontSize: 28,
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
                color: Colors.grey,
                elevation: 15,
                onPressed: () {
                  print('log');
                },
                child: Row(children: <Widget>[
                  SizedBox(width: 20),
                  Icon(
                    Icons.favorite,
                    color: Colors.black,
                  ),
                  SizedBox(width: 20),
                  Expanded(
                                      child: Text(
                      'Cardio (à venir)',
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
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
                color: Colors.grey,
                elevation: 15,
                onPressed: () {
                  //  getUserData();
                  // postRequest();
                },
                child: Row(children: <Widget>[
                  SizedBox(width: 20),
                  Icon(
                    Icons.accessibility_new,
                    color: Colors.black,
                  ),
                  SizedBox(width: 20),
                  Expanded(
                                      child: Text(
                      'Flexibilité (à venir)',
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(25),
                ),
              )),
              SizedBox(height: 20),
            ],
          ),
          duration: Duration(milliseconds: 2000),
        ));
  }

 }
