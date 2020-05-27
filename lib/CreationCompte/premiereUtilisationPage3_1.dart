import 'package:bdebody/heureDisponible.dart';
import 'package:bdebody/main.dart';
import 'package:flutter/material.dart';
import '../methodesHTTP.dart';

///Troisième page (1/2) de la première utilisation
class PremiereUtilisationPage3_1 extends StatefulWidget {
  @override
  _PremiereUtilisationPage3_1State createState() =>
      _PremiereUtilisationPage3_1State();
}

///Définit l'état d'une instance de [PremiereUtilisationPage3_1]
class _PremiereUtilisationPage3_1State
    extends State<PremiereUtilisationPage3_1> {
  ///Une liste de toutes les journée de la semaine
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
        backgroundColor: Colors.grey[800],
        body: SafeArea(
            child: Center(
          child: Container(
              padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
              child: ListView(
                children: <Widget>[
                  Text('Disponibilité durant la semaine',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2,
                        fontSize: 20,
                      )),
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
                              Navigator.pop(context);
                            }),
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
                              if (utilisateur.objectifUtilisateur != null) {
                                Navigator.pushReplacementNamed(
                                    context, '/home');
                              } else {
                                Navigator.pushNamed(
                                    context, '/premiereUtilisationPage4');
                              }
                              addDispos();
                            }),
                      ]),
                  Container(
                      padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          jourDisponible(utilisateur.disponibiliteSemaine),
                          debutDisponible(utilisateur.disponibiliteSemaine),
                          finDisponible(utilisateur.disponibiliteSemaine),
                        ],
                      ))
                ],
              )),
        )));
  }

/// Affiche le jours de chaque disponibilité du client [tempsLibre]
  Widget jourDisponible(List<HeureDisponible> tempsLibre) {
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < tempsLibre.length; i++) {
      list.add(new Text(
        tempsLibre.elementAt(i).jour,
        style: TextStyle(color: Colors.white),
      ));
    }
    return new Column(children: list);
  }
/// Affiche chaque début de disponibilité du client [tempsLibre]
  Widget debutDisponible(List<HeureDisponible> tempsLibre) {
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < tempsLibre.length; i++) {
      list.add(new Text(
        'Début :' + tempsLibre.elementAt(i).debut.toString().substring(10, 15),
        style: TextStyle(color: Colors.white),
      ));
    }
    return new Column(children: list);
  }
/// Affiche chaque fin de disponibilité du client [tempsLibre]
  Widget finDisponible(List<HeureDisponible> tempsLibre) {
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < tempsLibre.length; i++) {
      list.add(new Text(
        'Fin :' + tempsLibre.elementAt(i).fin.toString().substring(10, 15),
        style: TextStyle(color: Colors.white),
      ));
    }
    return new Column(children: list);
  }

/// Composante qui affiche des boutons pour que l'utilisateur,
/// par la suite, choisit ses entrainements selon la journée demandée [jour]
  Widget disponibilite(String jour) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          jour,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(width: 20),
        IconButton(
          color: Colors.white,
          icon: Icon(Icons.control_point),
          onPressed: () {
            Navigator.pushNamed(context, '/premiereUtilisationPage3_2',
                arguments: {'jour': jour});
          },
        ),
      ],
    );
  }
}
