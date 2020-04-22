import 'package:flutter/material.dart';

import '../../heureDisponible.dart';
import '../../main.dart';

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
        backgroundColor: Colors.grey[800], body: SafeArea(child: Center(
          child: Container(
          
          padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
  child: Column (
    mainAxisAlignment: MainAxisAlignment.center
    
    ,
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
 Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RaisedButton(
                              child: Text('Retour'),
                              onPressed: () {
                                Navigator.pop(context);}),
                          RaisedButton(
                              child: Text('Reset'),
                              onPressed: () {
                               setState(() {
                                 utilisateur.disponibiliteSemaine.clear();   
                               });
                                
 
                                
                               
                              }),      
                          RaisedButton(
                              child: Text('Confirmer'),
                              onPressed: () {
                               
                                   
 
                                Navigator.pushReplacementNamed(
                                    context, '/choixDeObjectif');
                               
                              }),
                        ]),
 Container(
                     padding: EdgeInsets.fromLTRB(50, 100, 50, 0),
                     height: 400,
                     
                     child:Row(  mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                       getTextWidgets(utilisateur.disponibiliteSemaine),
getTextWidgets2(utilisateur.disponibiliteSemaine),
getTextWidgets3(utilisateur.disponibiliteSemaine),
                     ], )
                       
                    ) 
    ],
  )
),
        )));
  }
 Widget getTextWidgets(List<HeureDisponible> strings)
  {
    List<Widget> list = new List<Widget>();
    for(var i = 0; i < strings.length; i++){
        list.add(new Text(strings.elementAt(i).jour));
           }
    return new Column( children: list);
  } 
   Widget getTextWidgets2(List<HeureDisponible> strings)
  {
    List<Widget> list = new List<Widget>();
    for(var i = 0; i < strings.length; i++){
        list.add(new Text('Début :'+strings.elementAt(i).debut.toString().substring(10,15)));
           }
    return new Column( children: list);
  } 
   Widget getTextWidgets3(List<HeureDisponible> strings)
  {
    List<Widget> list = new List<Widget>();
    for(var i = 0; i < strings.length; i++){
        list.add(new Text('Fin :'+strings.elementAt(i).fin.toString().substring(10,15)));
           }
    return new Column( children: list);
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
