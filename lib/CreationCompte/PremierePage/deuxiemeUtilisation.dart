import 'package:flutter/material.dart';

import '../../utilisateur.dart';

class DeuxiemeUtilisation extends StatefulWidget {
  @override
  _DeuxiemeUtilisationState createState() => _DeuxiemeUtilisationState();
}

class _DeuxiemeUtilisationState extends State<DeuxiemeUtilisation> {
  List<String> jour = [
    'Lundi',
    'Mardi',
    'Mercredi',
    'Jeudi',
    'Vendredi',
    'Samedi',
    'Dimanche'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellowAccent, body: SafeArea(child: Center(
          child: Container(
          padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
  child: Column (
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
Text(
  'Disponibilité durant la semaine',
  style: TextStyle(
    letterSpacing: 2,
    fontSize: 20,
  )
),


  disponibilite(jour.elementAt(0)),
  disponibilite(jour.elementAt(1)),
 disponibilite(jour.elementAt(2)),
 disponibilite(jour.elementAt(3)),
 disponibilite(jour.elementAt(4)),
 disponibilite(jour.elementAt(5)),
 disponibilite(jour.elementAt(6)),
 
    ],
  )
),
        )));
  }

   Widget disponibilite (String jour){
return Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: <Widget>[
  Text(jour
  ),
  SizedBox(width:20),
  IconButton(
    color: Colors.black,
    icon :Icon(Icons.control_point),
    onPressed:(){


Navigator.pushNamed(context, '/disponibilite',arguments: {'jour': jour});

    } ,
  ),
  

    
  
],
);
 } 
}
