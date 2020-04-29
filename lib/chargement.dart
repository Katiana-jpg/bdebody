import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'connexion.dart';

<<<<<<< HEAD
=======

/**
 * Écran de chargement de l'application
 */
>>>>>>> bc875bb3ea8936a746ad088d153e133e77b85881
class Chargement extends StatefulWidget {
  Chargement({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ChargementState();
}

class ChargementState extends State<Chargement> {
    /**
   * Affiche l"écran de chargement tant que les données de la base de donnée ne sont pas chargées
   */
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
<<<<<<< HEAD
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
        context,
=======
    Future.delayed(
      Duration(seconds: 5),// Il faut remplacer le 5 par le chargements des données de la base de donnée
      (){
        Navigator.push(context, 
>>>>>>> bc875bb3ea8936a746ad088d153e133e77b85881
        MaterialPageRoute(
          builder: (context) => Connexion(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        body: Center(
            child: Column(children: <Widget>[
          Expanded(
              flex: 1,
              child: Center(
                child: Text('BdeBody',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'Pacifico')),
              )),
          Expanded(
              flex: 1,
              child: Image.asset(
                "assets/Coureur.gif",
                fit: BoxFit.contain,
              )),
          Expanded(
              flex: 1,
              child: SpinKitWave(
                color: Colors.black,
              )),
        ])));
  }
}
