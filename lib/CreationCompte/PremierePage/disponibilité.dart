import 'package:flutter/material.dart';

class Disponibilite extends StatefulWidget {
  @override
  _DisponibiliteState createState() => _DisponibiliteState();
}

class _DisponibiliteState extends State<Disponibilite> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.yellowAccent,
        body: SafeArea(
child:Center(
  child: Container(
  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
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
disponibilite('Lundi')
    ],
  )
),
        
      ),
    ));
  }

 Widget disponibilite (String jour){
return Row(
children: <Widget>[
  Text(jour
  ),
  SizedBox(width:20),
  Expanded(

  child:TextFormField(

  ))
],
);
 } 
}