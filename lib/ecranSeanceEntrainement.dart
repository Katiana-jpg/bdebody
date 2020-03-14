import 'package:bdebody/entrainement.dart';
import 'package:bdebody/exercice.dart';
import 'package:bdebody/menu/menusEntrainements/menuEntrainementsActuels.dart';
import 'package:flutter/material.dart';

class EcranSeanceEntrainement extends StatefulWidget {
  @override
  _EcranSeanceEntrainementState createState() =>
      _EcranSeanceEntrainementState();
}

class _EcranSeanceEntrainementState extends State<EcranSeanceEntrainement>
    with TickerProviderStateMixin {
  Entrainement entrainement = entrainementActuel;

  //Index de l'exercice actuel de l'entrainement
  int index = 0;


  AnimationController controller;
 //Transforme la durée de l'exercice en String
  String get timerString {
    Duration duration = controller.duration * controller.value;

    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

//Démarre un timeren fonction de la durée de l'exercice
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration:
          Duration(seconds: entrainement.exercices.elementAt(index).duree),
    );
    controller.reverse(from: controller.value == 0.0 ? 1.0 : controller.value);
  }

  @override
  Widget build(BuildContext context) {
    //entrainement.exercices.addAll();
    if (index > entrainement.exercices.length - 1) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(backgroundColor : Colors.yellowAccent[700]),
            body: Center(
                child: Container(
          margin: EdgeInsets.all(10),
          child: Column(children: <Widget>[
            Expanded(flex: 4, child: SizedBox()),
            Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.grade,
                      color: Colors.yellowAccent[700],
                    ),
                    Icon(Icons.grade, color: Colors.yellowAccent[700]),
                    Icon(Icons.grade, color: Colors.yellowAccent[700]),
                    Icon(
                      Icons.grade,
                      color: Colors.yellowAccent[700],
                    ),
                    Icon(Icons.grade, color: Colors.yellowAccent[700]),
                    Icon(Icons.grade, color: Colors.yellowAccent[700]),
                    Icon(
                      Icons.grade,
                      color: Colors.yellowAccent[700],
                    ),
                    Icon(Icons.grade, color: Colors.yellowAccent[700]),
                    Icon(Icons.grade, color: Colors.yellowAccent[700]),
                  ]),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'ENTRAINEMENT TERMINÉ !',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
            Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.grade,
                      color: Colors.yellowAccent[700],
                    ),
                    Icon(Icons.grade, color: Colors.yellowAccent[700]),
                    Icon(Icons.grade, color: Colors.yellowAccent[700]),
                    Icon(
                      Icons.grade,
                      color: Colors.yellowAccent[700],
                    ),
                    Icon(Icons.grade, color: Colors.yellowAccent[700]),
                    Icon(Icons.grade, color: Colors.yellowAccent[700]),
                    Icon(
                      Icons.grade,
                      color: Colors.yellowAccent[700],
                    ),
                    Icon(Icons.grade, color: Colors.yellowAccent[700]),
                    Icon(Icons.grade, color: Colors.yellowAccent[700]),
                  ]),
            ),
            Expanded(flex: 4, child: SizedBox()),
          ]),
        ))),
      );
    } else {
      if (entrainement.exercices.elementAt(index).duree == 0) {
        return SafeArea(
          child: Scaffold(
          
            body: Center(
            child: Container(
              margin: EdgeInsets.all(30),
              child: Column(children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        (index + 1).toString() +
                            "/" +
                            (entrainement.exercices.length).toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Text(
                    entrainement.exercices.elementAt(index).nom,
                    style: TextStyle(
                      color: Colors.yellowAccent[700],
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  color: Colors.yellowAccent[700],
                  
                ),
               
                Expanded(
                    child: Column(
                  children: <Widget>[
                    
                    Text(
                      "Nombre de répétitions",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),


                    Container(
                      child: Text(
                        entrainement.exercices
                            .elementAt(index)
                            .nbreRepetition
                            .toString(),
                        style: TextStyle(
                          color: Colors.yellowAccent[700],
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                        flex: 3,
                        child: SizedBox(
                          width: 20,
                        )),
                    Expanded(
                        flex: 2,
                        child: RaisedButton(
                          color: Colors.yellowAccent[700],
                          elevation: 5,
                          onPressed: () {
                            setState(() {
                              index++;
                            });
                            controller.duration = Duration(
                                seconds: entrainement.exercices
                                    .elementAt(index)
                                    .duree);
                            controller.reverse(
                                from: controller.value == 0.0
                                    ? 1.0
                                    : controller.value);
                          },
                          child: Row(children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Suivant',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.black,
                              ),
                            ),
                          ]),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25),
                          ),
                        ))
                  ],
                ),
              ]),
            ),
          )),
        );
      } else {
        return SafeArea(
          child: Scaffold(
          
            body: Center(
            child: Container(
              margin: EdgeInsets.all(30),
              child: Column(children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        (index + 1).toString() +
                            "/" +
                            (entrainement.exercices.length).toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Text(
                    entrainement.exercices.elementAt(index).nom,
                    style: TextStyle(
                      color: Colors.yellowAccent[700],
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  color: Colors.yellowAccent[700],
                  
                ),
                
                Expanded(
                    child: Column(
                  children: <Widget>[
                    Text(
                      "Durée",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                
                    AnimatedBuilder(
                        animation: controller,
                        builder: (BuildContext context, Widget child) {
                          return Text(
                            timerString,
                            style: TextStyle(
                          color: Colors.yellowAccent[700],
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                          ));
                        }),
                    
                  ],
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                        flex: 3,
                        child: SizedBox(
                          width: 20,
                        )),
                    Expanded(
                        flex: 2,
                        child: RaisedButton(
                          color: Colors.yellowAccent[700],
                          elevation: 5,
                          onPressed: () {
                            setState(() {
                              index++;
                            });
                            controller.duration = Duration(
                                seconds: entrainement.exercices
                                    .elementAt(index)
                                    .duree);
                            controller.reverse(
                                from: controller.value == 0.0
                                    ? 1.0
                                    : controller.value);
                          },
                          child: Row(children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Suivant',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.black,
                              ),
                            ),
                          ]),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25),
                          ),
                        ))
                  ],
                ),
              ]),
            ),
          )),
        );
      }
    }
  }
}
