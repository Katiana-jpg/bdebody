import 'package:bdebody/menu/accueil.dart';
import 'package:flutter/material.dart';



class PremiereUtilisation extends StatefulWidget {
  PremiereUtilisation({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PremiereUtilisationState();
}

class PremiereUtilisationState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    Scaffold(
      body: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          child: FlatButton(
            child: Text('Soumettre'),
            onPressed: () {
//utilisateur.prenom = txtPrenom.onSubmitted(),
            },
          ),
        ),
      ]),
    );

    return null;
  }
}
