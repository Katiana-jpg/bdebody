import 'package:flutter/material.dart';

class Calendrier extends StatefulWidget {
  Calendrier({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CalendrierState();
}

class CalendrierState extends State<Calendrier> {
  List<String> annee = ['Année',
    '2020',
    '2021',
    '2022',
  ];
  String choixannee = 'Mois';
  List<String> mois = ['Mois','0', '1', '2', '3', '4'];
  String choixmois  ;
  List<String> jours = [
    'Jours',
    '0',
    '1',
    '2',
  ];
  String choixjours;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Row(
        children: <Widget>[
          Text(
            'Choix de la date :',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          SizedBox(width: 19.0),
          DropdownButton<String>(
            style: TextStyle(color: Colors.deepPurple, fontSize: 15.0),
            underline: Container(
              height: 2,
              color: Colors.black,
            ),
            value: annee.elementAt(0),
            iconSize: 24,
            elevation: 24,
            items: annee.map((String choix) {
              return DropdownMenuItem<String>(value: choix, child: Text(choix));
            }).toList(),
            onChanged: (String nouveau) {
              setState(() {
                this.choixannee = nouveau;
              });
            },
          ),
          SizedBox(width: 19.0),
          DropdownButton<String>(
            style: TextStyle(color: Colors.deepPurple, fontSize: 15.0),
            underline: Container(
              height: 2,
              color: Colors.black,
            ),
            value: mois.elementAt(0),
            items: mois.map((String choix) {
              return DropdownMenuItem<String>(value: choix, child: Text(choix));
            }).toList(),
            onChanged: (String nouveau) {
              setState(() {
                this.choixmois = nouveau;
              });
            },
          ),
          
          SizedBox(width: 19.0),
          DropdownButton<String>(
            style: TextStyle(color: Colors.deepPurple, fontSize: 15.0),
            underline: Container(
              height: 2,
              color: Colors.black,
            ),
            value:jours.elementAt(0),
            items: jours.map((String choix) {
              return DropdownMenuItem<String>(value: choix, child: Text(choix));
            }).toList(),
            onChanged: (String nouveau) {
              setState(() {
                this.choixjours = nouveau;
              });
            },
          ),
        ],
      ),
    ));
  }
}
