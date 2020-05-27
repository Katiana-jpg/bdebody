import 'package:flutter/material.dart';
import 'package:bdebody/heureDisponible.dart';
import 'package:bdebody/main.dart';

///Troisième page (2/2) de la première utilisation
class PremiereUtilisationPage3_2 extends StatefulWidget {
  final jourDisponible;
  PremiereUtilisationPage3_2({Key key, this.jourDisponible}) : super(key: key);
  @override
  _PremiereUtilisationPage3_2State createState() =>
      _PremiereUtilisationPage3_2State();
}

///Définit l'état d'une instance de [PremiereUtilisationPage3_2]
class _PremiereUtilisationPage3_2State
    extends State<PremiereUtilisationPage3_2> {
  ///  Prend les données envoyer par la page précédente
  Map data;

  ///   L'heure de départ de la disponibilité
  TimeOfDay depart = TimeOfDay.fromDateTime(DateTime(2020, 1, 1, 0, 0));

  /// L'heure de fin de la disponibilité
  TimeOfDay fin = TimeOfDay.fromDateTime(DateTime(2020, 1, 1, 0, 0));

  /// Composante qui affiche une horloge pour que l'utilisateur puisse choisir l'heure
  /// où il veut commencer la disponibilité
  Future<Null> tempsDepart(BuildContext context) async {
    /// L'heure qu'il choisi pour commencer la disponibilité
    final TimeOfDay tempsDepartChoisi =
        await showTimePicker(context: context, initialTime: depart);

    if (tempsDepartChoisi != null && tempsDepartChoisi != depart) {
      setState(() {
        depart = tempsDepartChoisi;
      });
    }
  }
/// Composante qui affiche une horloge pour que l'utilisateur puisse choisir l'heure
/// où il veut finir la disponibilité
  Future<Null> tempsFin(BuildContext context) async {
    /// L'heure qu'il choisi pour finir la disponibilité
    final TimeOfDay tempsFinChoisi =
        await showTimePicker(context: context, initialTime: fin);

    if (tempsFinChoisi != null && tempsFinChoisi != fin) {
      setState(() {
        fin = tempsFinChoisi;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: Builder(
            builder: (context) => SafeArea(
                  child: Center(
                    child: Container(
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Disponibilité durant la semaine',
                                style: TextStyle(
                                  letterSpacing: 2,
                                  fontSize: 20,
                                )),
                            SizedBox(height: 50),
                            disponibilite(data['jour']),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  SizedBox(width: 10),
                                  RaisedButton(
                                      child: Text('Retour'),
                                      onPressed: () {
                                        Navigator.pushReplacementNamed(context,
                                            '/premiereUtilisationPage3_1');
                                        setState(() {});
                                      }),
                                  RaisedButton(
                                      child: Text('Confirmer'),
                                      onPressed: () {
                                        if (fin.hour - depart.hour >= 0 &&
                                            fin != depart) {
                                          utilisateur.disponibiliteSemaine.add(
                                              HeureDisponible(
                                                  jour: data['jour'],
                                                  debut: depart.toString(),
                                                  fin: fin.toString()));

                                          Navigator.pushReplacementNamed(
                                              context,
                                              '/premiereUtilisationPage3_1');
                                        } else {
                                          Scaffold.of(context).showSnackBar(
                                              SnackBar(
                                                  content: Text(
                                                      'La plage horaire ne doit pas durée plus de 24 heures et doivent terminer avant 23H59')));
                                        }
                                      }),
                                  SizedBox(width: 10),
                                ]),
                          ],
                        )),
                  ),
                )));
  }

/// Composante qui affiche la ligne avec [tempsDepart] ainsi que [tempsFin].
/// 
/// L'utilisateur utilise cette composante pour choisir ses entrainements selon la journée demandée [jour]
  Widget disponibilite(String jour) {
    return Column(
      children: <Widget>[
        Text(
          jour,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        SizedBox(width: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
              color: Colors.amber,
              icon: Icon(Icons.timelapse),
              label: Text('Début'),
              onPressed: () {
                tempsDepart(context);
              },
            ),
            SizedBox(width: 20),
            Text(
              depart.toString().substring(10, 15),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
              color: Colors.amber,
              icon: Icon(Icons.timelapse),
              label: Text('Fin'),
              onPressed: () {
                tempsFin(context);
              },
            ),
            SizedBox(width: 20),
            Text(
              fin.toString().substring(10, 15),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ],
        ),
      ],
    );
  }
}
