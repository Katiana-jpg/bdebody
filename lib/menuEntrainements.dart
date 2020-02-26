
import 'package:bdebody/utilisateur.dart';
import 'package:flutter/material.dart';

class MenuEntrainements extends StatefulWidget {
  @override
  _MenuEntrainementsState createState() => _MenuEntrainementsState();
}

class _MenuEntrainementsState extends State<MenuEntrainements> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 25, 5, 100),
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
              
              Navigator.pushNamed(context, '/MenuEntrainementsActuels');
            },
            child: Row(children: <Widget>[
              SizedBox(width: 20),
              Icon(
                Icons.directions_run,
                color: Colors.black,
              ),
              SizedBox(width: 20),
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
              SizedBox(width: 20),
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
          ))
        ],
      ),
    );
  }
}

class MenuEntrainementsActuels extends StatefulWidget {
  @override
  _MenuEntrainementsActuelsState createState() =>
      _MenuEntrainementsActuelsState();
}

class _MenuEntrainementsActuelsState extends State<MenuEntrainementsActuels> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: new Utilisateur('Marc Antoine ', 'Hien', 17, 59, 181).listeEntrainements
            .map((item) => new RaisedButton(
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
                  onPressed: () {},
                  color: Colors.yellowAccent[700],
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(25),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

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
