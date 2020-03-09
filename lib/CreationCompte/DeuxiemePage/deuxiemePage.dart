import 'package:bdebody/CreationCompte/Final/confirmation.dart';
import 'package:flutter/material.dart';

import 'poids.dart';
import 'taille.dart';

class DeuxiemePage extends StatefulWidget {
  @override
  _DeuxiemePageState createState() => _DeuxiemePageState();
}

class _DeuxiemePageState extends State<DeuxiemePage> {
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.fromLTRB(15,60,15,15),
            child:Column(
            children: <Widget>[

             Poids(),
             SizedBox(height: 20.0,),
             Taille(),
             SizedBox(height: 20,),
             RaisedButton(
          onPressed: (){
Navigator.pushNamed(context, '/menuProfil');
Confirmation(poids: );
          },
          child: new Text('Valider'),
        )],
            ),
          ),
        ),
      ),
    );
  }
}