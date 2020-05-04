import 'package:bdebody/heureDisponible.dart';
import 'package:bdebody/main.dart';
import 'package:flutter/material.dart';

class PremiereUtilisationPage3_1 extends StatefulWidget {
  PremiereUtilisationPage3_1({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() =>
      PremiereUtilisationPage3_1State();
}

class PremiereUtilisationPage3_1State
    extends State<PremiereUtilisationPage3_1> {
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Disponibilité durant la semaine',
                      style: TextStyle(
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
                            child: Text('Effacer Tout'),
                            onPressed: () {
                              setState(() {
                                utilisateur.disponibiliteSemaine.clear();
                              });
                            }),
                        RaisedButton(
                            child: Text('Confirmer'),
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, '/premiereUtilisationPage4');
                            }),
                      ]),
                  Container(
                      padding: EdgeInsets.fromLTRB(50, 100, 50, 0),
                      height: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          jourDeLaDisponibilite(
                              utilisateur.disponibiliteSemaine),
                          debutDeLaDisponibilite(
                              utilisateur.disponibiliteSemaine),
                          finDeLaDisponibilite(
                              utilisateur.disponibiliteSemaine),
                        ],
                      ))
                ],
              )),
        )));
  }

  ///Affiche le jour de chaque élément de la liste des disponibilités du client [disponibiliteSemaine]
  Widget jourDeLaDisponibilite(List<HeureDisponible> disponibiliteSemaine) {
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < disponibiliteSemaine.length; i++) {
      list.add(new Text(disponibiliteSemaine.elementAt(i).jour));
    }
    return new Column(children: list);
  }

  ///Affiche le début de chaque plage horaire de la liste des disponibilités du client [disponibiliteSemaine]
  Widget debutDeLaDisponibilite(List<HeureDisponible> disponibiliteSemaine) {
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < disponibiliteSemaine.length; i++) {
      list.add(new Text('Début :' +
          disponibiliteSemaine
              .elementAt(i)
              .debut
              .toString()
              .substring(10, 15)));
    }
    return new Column(children: list);
  }

  ///Affiche la fin de chaque plage horaire de la liste des disponibilités du client [disponibiliteSemaine]
  Widget finDeLaDisponibilite(List<HeureDisponible> disponibiliteSemaine) {
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < disponibiliteSemaine.length; i++) {
      list.add(new Text('Fin :' +
          disponibiliteSemaine.elementAt(i).fin.toString().substring(10, 15)));
    }
    return new Column(children: list);
  }

  /// Une ligne de bouton pour amener le client à choisir la journée [jour]
  /// où il veut avoir une disponibilité pour faire de l'exercice
  Widget disponibilite(String jour) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(jour),
        SizedBox(width: 20),
        IconButton(
          color: Colors.black,
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
