import 'package:bdebody/menu/accueil.dart';
import 'package:flutter/material.dart';



class PremiereUtilisation extends StatefulWidget {
  PremiereUtilisation({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PremiereUtilisationState();
}

class PremiereUtilisationState extends State<PremiereUtilisation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      body:   SafeArea(
child: SingleChildScrollView(
       child: Container(
         
          padding: EdgeInsets.all(60),
          child: Column(
           
            children: <Widget>[
         
          Text(
            'Prénom'
          ),
          Text('Nom'),
          Text('Âge'),
          Text('Courriel'),
          Text('Mot de passe'),
             ] ),
      ))),
    );

    
  }
}
