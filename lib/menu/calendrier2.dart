import 'package:flutter/material.dart';

import '../main.dart';
import 'menusEntrainements/menuSelectionMuscles.dart';

/**
 * Permet de construire des calendriers
 */
class Calendrier2 extends StatefulWidget {
  Calendrier2({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Calendrier2State();
}

class Calendrier2State extends State<Calendrier2> {
  final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
  padding: const EdgeInsets.all(8),
  children: <Widget>[
    Container(
                            child: RaisedButton(
                          //color: _colors[_currentIndexes[0]],
                          splashColor: Colors.red,
                          elevation: 15,
                          onPressed: () {
                            // if (listeMuscles.contains("Bras")) {
                            //   listeMuscles.remove("Bras");
                            // } else {
                            //   listeMuscles.add("Bras");
                            // }
                            // listeMuscles.forEach((string) => print(string));
                            // _onChanged(0);
                          },
                          child: Row(children: <Widget>[
                            SizedBox(width: 10),
                            Icon(
                              Icons.add_circle,
                              color: Colors.black,
                            ),
                            Text(
                              'Bras',
                              style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 2.0,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25),
                          ),
                        )),
                        SizedBox(height: 5),
                        Container(
                            child: RaisedButton(
                          //color: _colors[_currentIndexes[1]],
                          splashColor: Colors.red,
                          elevation: 15,
                          onPressed: () {
                            // if (listeMuscles.contains("Torse")) {
                            //   listeMuscles.remove("Torse");
                            // } else {
                            //   listeMuscles.add("Torse");
                            // }
                            // listeMuscles.forEach((string) => print(string));
                            // _onChanged(1);
                          },
                          child: Row(children: <Widget>[
                            SizedBox(width: 10),
                            Icon(
                              Icons.add_circle,
                              color: Colors.black,
                            ),
                            Text(
                              'Torse',
                              style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 2.0,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25),
                          ),
                        )),
                        SizedBox(height: 5),
                        Container(
                            child: RaisedButton(
                          color: Colors.cyan,
                          splashColor: Colors.red,
                          elevation: 15,
                          onPressed: () {
                            // if (listeMuscles.contains("Jambes")) {
                            //   listeMuscles.remove("Jambes");
                            // } else {
                            //   listeMuscles.add("Jambes");
                            // }
                            // _onChanged(2);
                            // listeMuscles.forEach((string) => print(string));
                            // //print(listeMuscles.elementAt(0)+listeMuscles.elementAt(1)+listeMuscles.elementAt(2));
                          },
                          child: Row(children: <Widget>[
                            SizedBox(width: 10),
                            Icon(
                              Icons.add_circle,
                              color: Colors.black,
                            ),
                            Text(
                              'Jambes',
                              style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 2.0,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25),
                          ),
                        )),
                        SizedBox(height: 20),
                        Container(
                            child: RaisedButton(
                         // color: _colors[_currentIndexes[0]],
                          splashColor: Colors.red,
                          elevation: 15,
                          onPressed: () {
                            //intensiteEntrainement = "Debutant";
                          },
                          child: Row(children: <Widget>[
                            SizedBox(width: 10),
                            Icon(
                              Icons.add_circle,
                              color: Colors.black,
                            ),
                            Text(
                              'Débutant',
                              style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 2.0,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25),
                          ),
                        )),
                        SizedBox(height: 5),
                        Container(
                            child: RaisedButton(
                         // color: _colors[_currentIndexes[1]],
                          splashColor: Colors.red,
                          elevation: 15,
                          onPressed: () {
                           // intensiteEntrainement = "Intermediaire";
                          },
                          child: Row(children: <Widget>[
                            SizedBox(width: 10),
                            Icon(
                              Icons.add_circle,
                              color: Colors.black,
                            ),
                            Text(
                              'Intermédiaire',
                              style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 2.0,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25),
                          ),
                        )),
                        SizedBox(height: 5),
                        Container(
                            child: RaisedButton(
                         // color: _colors[_currentIndexes[2]],
                          splashColor: Colors.red,
                          elevation: 15,
                          onPressed: () {
                         //   intensiteEntrainement = "Avance";
                          },
                          child: Row(children: <Widget>[
                            SizedBox(width: 10),
                            Icon(
                              Icons.add_circle,
                              color: Colors.black,
                            ),
                            Text(
                              'Avancé',
                              style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 2.0,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25),
                          ),
                        )),
                        SizedBox(height: 5),
                        TextField(
                          obscureText: false,
                          onChanged: (str) {
                          //  nomEntrainement = str;
                          },
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              hintText: "Nom de l'entrainement",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0))),
                        ),
                        Divider(
                          thickness: 5,
                          height: 50,
                          indent: 20,
                          endIndent: 20,
                        ),
                        Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.amber,
                          child: MaterialButton(
                              minWidth: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              splashColor: Colors.green,
                              // onPressed: () {
                              //  //vérifie si aucun entrainement existant porte déja ce nom
                              //  //si non, crée l'entrainement
                              //   bool nomUnique = true;
                              //   utilisateur.listeEntrainements
                              //       .forEach((entrainement) => {
                              //             if (entrainement.nomEntrainement ==
                              //         //        nomEntrainement)
                              //               {nomUnique = false}
                              //           });
                              //   if (nomUnique) {
                              //     creerEntrainement(
                              //        // listeMuscles, intensiteEntrainement, nomEntrainement);
                              //   }else{
                              //     Scaffold.of(context).showSnackBar(SnackBar(content: Text("Nom déjà pris pour entrainement"),));
                              //   }
                              // },
                              onPressed: (){},
                              child: Text(
                                "Créer l'entrainement",
                                textAlign: TextAlign.center,
                              )),
                        )
                      ],
                    ),
                  
  
);
  }
}
