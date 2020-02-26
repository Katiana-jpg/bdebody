
import 'package:flutter/material.dart';

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
                onPressed: () {},
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
                onPressed: () {},
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
                onPressed: () {},
                child: Row(children: <Widget>[
                  SizedBox(width: 20),
                  Icon(
                    Icons.accessibility_new,
                    color: Colors.black,
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Flexibilité',
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
}