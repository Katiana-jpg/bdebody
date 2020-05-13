import 'dart:convert';

import 'package:bdebody/main.dart';
import 'package:bdebody/utilisateur.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../entrainement.dart';
import '../../exercice.dart';

class MenuChoisirTypeEntrainements extends StatefulWidget {
  @override
  _MenuChoisirTypeEntrainementsState createState() =>
      _MenuChoisirTypeEntrainementsState();
}

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
                  Navigator.pushNamed(context, '/MenuSelectionMuscles');
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
                color: Colors.yellowAccent[700],
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
                  Text(
                    'Cardio',
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
                color: Colors.yellowAccent[700],
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
                  Text(
                    'Avancé',
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
            ],
          ),
          duration: Duration(milliseconds: 2000),
        ));
  }

//   void postRequest() async {
//     //String url ='http://192.168.2.14:8080/user/yves/add-entrainement';
//     print('log1');
//     // Map data = new Entrainement(nomEntrainement : "Lundi", exercices :[
//     //     new Exercice("Push-up", 0, 10, "description"),
//     //     new Exercice("Jumping jacks", 30, 0, "description"),
//     //     new Exercice("Dips", 0, 15, "description"),
//     //     new Exercice("Squats", 0, 20, "description"),
//     //     new Exercice("Planche", 30, 1, "description")
//     //   ]).toJson();
    
//     // Map data = {
//     //   'Test': 'Test successful',
//     // };
//     //encode Map to JSON
//     //var body =
    
//     //String body = json.encode(data);
//     String body = json.encode({"Flutter" : "App"});
//     Response response = await post(
//         'http://192.168.2.14:8080/user/yves/add-entrainement',
//         headers: {"Content-Type": "application/json"},
//         body: body,

//     );

//     //print("${response.statusCode}");
//     print(json.decode(response.body));
//     print('log2');
//     //return response;
//   }
 }
