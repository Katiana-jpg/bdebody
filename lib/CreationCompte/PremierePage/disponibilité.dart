import 'package:flutter/material.dart';

import '../../heureDisponible.dart';

import '../../main.dart';
import '../../utilisateur.dart';

class Disponibilite extends StatefulWidget {
  final data;
  Disponibilite({Key key, this.data}) : super(key: key);
  @override
  _DisponibiliteState createState() => _DisponibiliteState();
}

class _DisponibiliteState extends State<Disponibilite> {
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
        backgroundColor: Colors.yellowAccent,
        body: Builder(
          builder:(context) =>
          SafeArea(
          child: Center(
            child: Container(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text('Disponibilité durant la semaine',
                        style: TextStyle(
                          letterSpacing: 2,
                          fontSize: 20,
                        )),
                    disponibilite(data['jour']),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RaisedButton(
                              child: Text('Retour'),
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, '/deuxiemePage');
                                    setState(() {
                                  
                                    });
                              }),
                          RaisedButton(
                              child: Text('Confirmer'),
                              onPressed: () {
                             if(fin.minute-depart.minute >=0 && fin.hour-depart.hour >=0 && fin !=depart  ){   utilisateur.disponibiliteSemaine.add(
                                    HeureDisponible(
                                        jour: data['jour'],
                                        debut: depart,
                                        fin: fin));
 
                                Navigator.pushReplacementNamed(
                                    context, '/deuxiemePage');
                               }
                             else {Scaffold.of(context).showSnackBar(SnackBar(content: Text('La plage horaire ne doit pas durée plus de 24 heures')) );  }}),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(jour),
        SizedBox(width: 20),
        FlatButton.icon(
          color: Colors.yellowAccent,
          icon: Icon(Icons.timelapse),
          label: Text('Début'),
          onPressed: () {
            selectTimeDepart(context);
          },
        ),
        SizedBox(width: 20),
        Text(depart.toString().substring(10, 15)),
        SizedBox(width: 20),
        FlatButton.icon(
          color: Colors.yellowAccent,
          icon: Icon(Icons.timelapse),
          label: Text('Fin'),
          onPressed: () {
            selectTimeFin(context);
          },
        ),
        SizedBox(width: 20),
        Text(fin.toString().substring(10, 15)),
      ],
    );
  }
}
