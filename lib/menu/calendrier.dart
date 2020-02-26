import 'package:flutter/material.dart';

class Calendrier extends StatefulWidget {
  Calendrier({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CalendrierState();
}

class CalendrierState extends State<Calendrier> {
  List <String> annee = ['2020','2021','2022',];
  String choixannee ;
  List <String> mois = ['0','1','2','3','4'];
  String choixmois ;
  List <String> jours = ['0','1','2',];
  String choixjours ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          
          child: Row(
            children: <Widget>[
              SizedBox(width :30.0),
              Text('Année',
              style: TextStyle(
                color:Colors.yellowAccent,
              ),),
              SizedBox(width :20.0),
              DropdownButton <String>(
                value:choixannee,
                
                items: annee.map((String choix){
                  return DropdownMenuItem<String>(
                    value: choix,
                    child: Text(choix));
                }).toList(),
                 onChanged:(String nouveau) {
                   setState(() {
                     this.choixannee = nouveau;
                   });},
              ),Text('mois',
              style: TextStyle(
                color:Colors.yellowAccent,
              ),),
              SizedBox(width :20.0),
              DropdownButton <String>(
                value:choixmois,
                items: mois.map((String choix){
                  return DropdownMenuItem<String>(
                    value: choix,
                    child: Text(choix));
                }).toList(),
                 onChanged:(String nouveau) {
                   setState(() {
                     this.choixmois = nouveau;
                   });},
              ),Text('jour',
              style: TextStyle(
                color:Colors.yellowAccent,
              ),),
              SizedBox(width :20.0),
              DropdownButton <String>(
                value:choixjours,
                items: jours.map((String choix){
                  return DropdownMenuItem<String>(
                    value: choix,
                    child: Text(choix));
                }).toList(),
                 onChanged:(String nouveau) {
                   setState(() {
                     this.choixjours = nouveau;
                   });},
              ),
            ],
          ),
        ));
}
}