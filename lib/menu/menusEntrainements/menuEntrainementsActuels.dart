import 'package:bdebody/entrainement.dart';
import 'package:flutter/material.dart';

import '../../utilisateur.dart';

class MenuEntrainementsActuels extends StatefulWidget {
  @override
  _MenuEntrainementsActuelsState createState() =>
      _MenuEntrainementsActuelsState();
}
Entrainement entrainementActuel;
class _MenuEntrainementsActuelsState extends State<MenuEntrainementsActuels> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: false,
          //titleSpacing: 3.0,
          title: const Text(
            "Choisissez un entraînement",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.yellowAccent[700],
          elevation: 2.0,
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(20, 25, 20, 100),
          child: Column(

            children: new Utilisateur().listeEntrainements

            children: new Utilisateur('Marc Antoine ', 'Hien', 17, 59, 181)
                .listeEntrainements

                .map((item) => Expanded(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: new RaisedButton(
                              child: Row(children: <Widget>[
                                SizedBox(width: 20),
                                Icon(
                                  Icons.fitness_center,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 20),
                                Text(
                                  item.nomEntrainement,
                                  style: TextStyle(
                                    color: Colors.black,
                                    letterSpacing: 2.0,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ]),
                              onPressed: () {
                                Navigator.pushNamed(context, '/ecranSeanceEntrainement');
                                entrainementActuel = item;
                              },
                              color: Colors.yellowAccent[700],
                              elevation: 15,
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(25),
                              ),
                            ),
                          ),
                          SizedBox(height: 10)
                        ],
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
