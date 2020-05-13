import 'package:flutter/material.dart';

import 'package:bdebody/heureDisponible.dart';
import 'package:bdebody/main.dart';

class PremiereUtilisationPage3_2 extends StatefulWidget {
  final data;
  PremiereUtilisationPage3_2({Key key, this.data}) : super(key: key);
  @override
  _PremiereUtilisationPage3_2State createState() =>
      _PremiereUtilisationPage3_2State();
}

class _PremiereUtilisationPage3_2State
    extends State<PremiereUtilisationPage3_2> {
  Map data;
  TimeOfDay depart = TimeOfDay.fromDateTime(DateTime(2020, 1, 1, 0, 0));
  TimeOfDay fin = TimeOfDay.fromDateTime(DateTime(2020, 1, 1, 0, 0));
  Future<Null> selectTimeDepart(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: depart);

    if (picked != null && picked != depart) {
      setState(() {
        depart = picked;
      });
    }
  }

  Future<Null> selectTimeFin(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: fin);

    if (picked != null && picked != fin) {
      setState(() {
        fin = picked;
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
                                  SizedBox(width:10),
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
                                        if (  fin.hour - depart.hour >= 0 &&
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
                                      SizedBox(width:10),
                                ]),
                          ],
                        )),
                  ),
                )));
  }

// utilisateur.disponibiliteSemaine.forEach((HeureDisponible){
  // print("jour : ${HeureDisponible.jour}");
  // print("debut : ${HeureDisponible.debut.toString().substring(10,15)}");
  // print("fin : ${HeureDisponible.fin.toString().substring(10,15)}");
  // })

  Widget disponibilite(String jour) {
    return Column(
      children: <Widget>[
        Text(jour, style: TextStyle(color : Colors.white, fontWeight: FontWeight.bold, fontSize: 30),),
        SizedBox(width: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            
            FlatButton.icon(
              color: Colors.amber,
              icon: Icon(Icons.timelapse),
              label: Text('Début'),
              onPressed: () {
                selectTimeDepart(context);
              },
            ),
            SizedBox(width: 20),
            Text(depart.toString().substring(10, 15), style: TextStyle(color : Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
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
                selectTimeFin(context);
              },
            ),
            SizedBox(width: 20),
            Text(fin.toString().substring(10, 15), style: TextStyle(color : Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
          ],
        ),
      ],
    );
  }
}
