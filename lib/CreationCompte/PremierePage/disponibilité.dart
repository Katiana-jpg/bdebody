import 'package:flutter/material.dart';

class Disponibilite extends StatefulWidget {
  @override
  _DisponibiliteState createState() => _DisponibiliteState();
}

class _DisponibiliteState extends State<Disponibilite> {
   TimeOfDay depart = TimeOfDay.fromDateTime(DateTime(2020,1,1,0,0) );
  TimeOfDay fin = TimeOfDay.fromDateTime(DateTime(2020,1,1,0,0)) ; 

  Future<Null> selectTimeDepart(BuildContext context)async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
     initialTime: depart );

if(picked !=  null && picked != depart){
setState(() {
  depart = picked;
});
}
  }
  Future<Null> selectTimeFin(BuildContext context)async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
     initialTime: fin );

if(picked !=  null && picked != fin){
setState(() {
  fin = picked;
});
}
  }
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
  mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
  Text(jour
  ),
  SizedBox(width:20),
  FlatButton.icon(
    color: Colors.yellowAccent,
    icon :Icon(Icons.timelapse),
    label:Text('Début'),
    onPressed:(){
selectTimeDepart(context);
    } ,
  ),
  SizedBox(width:20),
Text(depart.toString().substring(10,15)),
SizedBox(width:20),
  FlatButton.icon(
    color: Colors.yellowAccent,
    icon :Icon(Icons.timelapse),
    label:Text('Fin'),
    onPressed:(){
selectTimeFin(context);
    } ,
  ),
  SizedBox(width:20),
Text(fin.toString().substring(10,15)),
],
);
 } 
}