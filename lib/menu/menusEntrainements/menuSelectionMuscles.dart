import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:bdebody/heureDisponible.dart';
import 'package:bdebody/main.dart';
import 'package:bdebody/utilisateur.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../entrainement.dart';
import '../../exercice.dart';
import '../../exercice.dart';

class MenuSelectionMuscles extends StatefulWidget {
  @override
  _MenuSelectionMusclesState createState() => _MenuSelectionMusclesState();
}

class _MenuSelectionMusclesState extends State<MenuSelectionMuscles> {
  List<Color> _colors = [
    //Get list of colors
    Colors.yellowAccent[700],
    Colors.amber[900]
  ];

  List<String> listeMuscles = new List<String>();
  String nomEntrainement;
  String intensiteEntrainement;

  List<int> _currentIndexes = [0, 0, 0, 0, 0, 0];
  // List<int> _currentIndexesIntensite = [0, 0, 0];

  _onChanged(int bouton) {
    //update with a new color when the user taps button
    int _colorCount = _colors.length;

    setState(() {
      //change la couleur des boutons de muscles
      if (bouton < 3) {
        if (_currentIndexes.elementAt(bouton) == _colorCount - 1) {
          _currentIndexes[bouton] = 0;
        } else {
          _currentIndexes[bouton] += 1;
        }
      } else {
        //change la couleur des boutons d'intensité
        if (_currentIndexes.elementAt(bouton) == 0) {
          _currentIndexes[3] = 0;
          _currentIndexes[4] = 0;
          _currentIndexes[5] = 0;
          _currentIndexes[bouton] = 1;
        } else {
          _currentIndexes[bouton] = 0;
        }
      }
    });

    //setState(() => (_currentIndex == _colorCount - 1) ? _currentIndex = 1 : _currentIndex += 1);
  }

  MaterialColor couleurCreer() {
    if (nomEntrainement == "" || nomEntrainement == null) {
      return Colors.grey;
    } else {
      return Colors.amber;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: false,
          //titleSpacing: 3.0,
          title: const Text(
            "Sélectionner un type d'entraînement",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.yellowAccent[700],
          elevation: 2.0,
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                        height: 50,
                        child: RaisedButton(
                          color: _colors[_currentIndexes[0]],
                          splashColor: Colors.red,
                          elevation: 10,
                          onPressed: () {
                            if (listeMuscles.contains("Bras")) {
                              listeMuscles.remove("Bras");
                            } else {
                              listeMuscles.add("Bras");
                            }
                            listeMuscles.forEach((string) => print(string));
                            _onChanged(0);
                          },
                          child:
                              //SizedBox(width: 10),

                              Text(
                            'Bras',
                            style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 2.0,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25),
                          ),
                        )),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                      child: Container(
                    height: 50,
                    child: RaisedButton(
                      color: _colors[_currentIndexes[1]],
                      splashColor: Colors.red,
                      elevation: 10,
                      onPressed: () {
                        if (listeMuscles.contains("Torse")) {
                          listeMuscles.remove("Torse");
                        } else {
                          listeMuscles.add("Torse");
                        }
                        listeMuscles.forEach((string) => print(string));
                        _onChanged(1);
                      },
                      child: Text(
                        'Torse',
                        style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 2.0,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(25),
                      ),
                    ),
                  )),
                  SizedBox(width: 5),
                  Expanded(
                    child: Container(
                        height: 50,
                        child: RaisedButton(
                          color: _colors[_currentIndexes[2]],
                          splashColor: Colors.red,
                          elevation: 10,
                          onPressed: () {
                            if (listeMuscles.contains("Jambes")) {
                              listeMuscles.remove("Jambes");
                            } else {
                              listeMuscles.add("Jambes");
                            }
                            _onChanged(2);
                            listeMuscles.forEach((string) => print(string));
                            //print(listeMuscles.elementAt(0)+listeMuscles.elementAt(1)+listeMuscles.elementAt(2));
                          },
                          child: Text(
                            'Jambes',
                            style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 2.0,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25),
                          ),
                        )),
                  ),
                ],
              ),
              Divider(
                thickness: 5,
                height: 50,
                indent: 20,
                endIndent: 20,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                        height: 50,
                        child: RaisedButton(
                          color: _colors[_currentIndexes[3]],
                          splashColor: Colors.red,
                          elevation: 10,
                          onPressed: () {
                            intensiteEntrainement = "Debutant";
                            _onChanged(3);
                          },
                          child: Text(
                            'Débutant',
                            style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 2.0,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25),
                          ),
                        )),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Container(
                        height: 50,
                        child: RaisedButton(
                          color: _colors[_currentIndexes[4]],
                          splashColor: Colors.red,
                          elevation: 10,
                          onPressed: () {
                            intensiteEntrainement = "Intermediaire";
                            _onChanged(4);
                          },
                          child: Text(
                            'Intermédiaire',
                            style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 2.0,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25),
                          ),
                        )),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Container(
                        height: 50,
                        child: RaisedButton(
                          color: _colors[_currentIndexes[5]],
                          splashColor: Colors.red,
                          elevation: 10,
                          onPressed: () {
                            intensiteEntrainement = "Avance";
                            _onChanged(5);
                          },
                          child: Text(
                            'Avancé',
                            style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 2.0,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25),
                          ),
                        )),
                  ),
                  SizedBox(width: 5),
                ],
              ),
              Divider(
                thickness: 5,
                height: 50,
                indent: 20,
                endIndent: 20,
              ),
              TextField(
                obscureText: false,
                onChanged: (str) {
                  nomEntrainement = str;
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
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
                color: couleurCreer(),
                child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    splashColor: Colors.orange,
                    onPressed: () {
                      //vérifie si aucun entrainement existant porte déja ce nom
                      //si non, crée l'entrainement
                      bool nomUnique = true;
                      utilisateur.listeEntrainements.forEach((entrainement) => {
                            if (entrainement.nomEntrainement == nomEntrainement)
                              {nomUnique = false}
                          });
                      if (nomUnique) {
                        creerEntrainement(listeMuscles, intensiteEntrainement,
                            nomEntrainement, plageHoraireSelectionne);
                            
                      } else {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("Nom déjà pris pour entrainement"),
                        ));
                      }
                    },
                    child: Text(
                      "Créer l'entrainement",
                      textAlign: TextAlign.center,
                    )),
              )
            ],
          ),
        ));
  }
}

void creerEntrainement(List<String> listeMuscles, String intensiteEntrainement,
    String nomEntrainement, HeureDisponible plageHoraire) async {
  String url = "http://192.168.2.14:8080/get-liste-exercices";
  Response response = await get(url);

//Récupère une liste de ligne de donnée
  List<dynamic> exercicesDeBase = jsonDecode(response.body);

  utilisateur.exercicesDeBase.clear();

  //Récupère les exercices de base
  exercicesDeBase.forEach((exercice) {
    utilisateur.exercicesDeBase.add(new Exercice(
        nom: exercice['nom'],
        intensite: exercice['intensite'],
        description: exercice['description'],
        duree: exercice['duree'],
        nbreRepetition: exercice['repetitions']));
  });

  //Liste des exercices à mettre dans le nouvel entrainement
  List<Exercice> exercicesCorrespondantEntrainement = new List<Exercice>();
  List<Exercice> exercicesPourEntrainementTemp = new List<Exercice>();

//ajoute les exercices qui ciblent les bon muscles à une list d'exercices valides pour l'entrainement
//Les exercices sont de l'intensité choisie ou d'intensité plus basse amis ayant subit une mise à niveau
  utilisateur.exercicesDeBase.forEach((exercice) => {
        if (intensiteEntrainement == "Debutant")
          {
            listeMuscles.forEach((muscle) => {
                  if (exercice.description.contains(muscle) &&
                      !exercicesCorrespondantEntrainement.contains(exercice) &&
                      exercice.intensite == "Debutant")
                    {exercicesCorrespondantEntrainement.add(exercice)}
                })
          }
        else if (intensiteEntrainement == "Intermediaire")
          {
            listeMuscles.forEach((muscle) => {
                  if (exercice.description.contains(muscle) &&
                      !exercicesCorrespondantEntrainement.contains(exercice))
                    {
                      if (exercice.intensite == "Intermediaire")
                        {exercicesCorrespondantEntrainement.add(exercice)}
                      else if (exercice.intensite == "Debutant")
                        {
                          exercicesCorrespondantEntrainement.add(exercice),
                          //ajoute un exercice pour débutant mais augmente sa difficulté en multipliant durée et répétirion par 1.5
                          exercicesCorrespondantEntrainement.last.duree =
                              (exercicesCorrespondantEntrainement.last.duree *
                                      1.5)
                                  .toInt(),
                          exercicesCorrespondantEntrainement
                                  .last.nbreRepetition =
                              (exercicesCorrespondantEntrainement
                                          .last.nbreRepetition *
                                      1.5)
                                  .toInt()
                        }
                    }
                })
          }
        else if (intensiteEntrainement == "Avance")
          {
            listeMuscles.forEach((muscle) => {
                  if (exercice.description.contains(muscle) &&
                      !exercicesCorrespondantEntrainement.contains(exercice))
                    {
                      if (exercice.intensite == "Avance")
                        {exercicesCorrespondantEntrainement.add(exercice)}
                      else if (exercice.intensite == "Intermediaire")
                        {
                          exercicesCorrespondantEntrainement.add(exercice),
                          //ajoute un exercice pour intermédiaire mais augmente sa difficulté en multipliant durée et répétirion par 1.5
                          exercicesCorrespondantEntrainement.last.duree =
                              (exercicesCorrespondantEntrainement.last.duree *
                                      1.5)
                                  .toInt(),
                          exercicesCorrespondantEntrainement
                                  .last.nbreRepetition =
                              (exercicesCorrespondantEntrainement
                                          .last.nbreRepetition *
                                      1.5)
                                  .toInt()
                        }
                      else if (exercice.intensite == "Debutant")
                        {
                          exercicesCorrespondantEntrainement.add(exercice),
                          //ajoute un exercice pour débutant mais augmente sa difficulté en multipliant durée et répétirion par 2
                          exercicesCorrespondantEntrainement.last.duree =
                              (exercicesCorrespondantEntrainement.last.duree *
                                      1.5)
                                  .toInt(),
                          exercicesCorrespondantEntrainement
                                  .last.nbreRepetition =
                              (exercicesCorrespondantEntrainement
                                          .last.nbreRepetition *
                                      1.5)
                                  .toInt()
                        }
                    }
                })
          }
      });

  //choisit 6 exercices au hasard parmi les exercices valides et les ajoutes à la liste des execices de l'entrainement
  final _random = new Random();
  int compteur = 0;
  if (exercicesCorrespondantEntrainement.length != 0) {
    while (compteur < 6) {
      exercicesPourEntrainementTemp.add(
          exercicesCorrespondantEntrainement.elementAt(
              _random.nextInt(exercicesCorrespondantEntrainement.length)));
      compteur++;
    }
  } else {
    // Scaffold.of(context).showSnackBar(SnackBar(content: Text("Présentement aucun n'exercices dans la base de donnée ne correspond à l'entranement que vous souhaitez créer"),));
  }

  List<Exercice> exercicesPourEntrainement =
      exercicesPourEntrainementTemp + exercicesPourEntrainementTemp;
  //exercicesPourEntrainement.addAll(exercicesPourEntrainementTemp);

  //Entrainement entrainement = new Entrainement(nomEntrainement: "nom test", exercices: exercicesPourEntrainement);

  //crée l'objet Entrainement et l'ajoute à la liste des entrainements de l'utilisateur
  utilisateur.listeEntrainements.add(new Entrainement(
      nomEntrainement: nomEntrainement,
      exercices: exercicesPourEntrainement,
      intensite: intensiteEntrainement,
      plageHoraire: plageHoraire));
  String urlAddEntrainement = "http://192.168.2.14:8080/add-entrainement";

  await post(urlAddEntrainement, body: {
    "courriel": utilisateur.courriel,
    "password": utilisateur.motDePasse,
    "nomEntrainement": utilisateur.listeEntrainements.last.nomEntrainement,
    "jour": utilisateur.listeEntrainements.last.plageHoraire.jour,
    "debut": utilisateur.listeEntrainements.last.plageHoraire.debut,
    "fin": utilisateur.listeEntrainements.last.plageHoraire.fin,
  });

//Fait en sorte que la plage horaire de l'entrainement soit considérée occupée
utilisateur.listeEntrainements.last.plageHoraire.isUsed=true;

  String urlAddExercices =
      "http://192.168.2.14:8080/add-exercices-entrainement";
  List<Map<String, dynamic>> listeExercices = List<Map<String, dynamic>>();

//pour chaque exercice du dernier entrainement, ajoute un objet JSON à la liste_exercices à envoyer dans le server
  utilisateur.listeEntrainements
      .elementAt(utilisateur.listeEntrainements.length - 1)
      .exercices
      .forEach((exercice) => {
            listeExercices.add(exercice
                .toMap(utilisateur.listeEntrainements.last.nomEntrainement))
          });

  print(listeExercices);

  //Transforme les exercices en string json
  List<String> listeExercicesString = new List<String>();
  listeExercices
      .forEach((exercice) => {listeExercicesString.add(jsonEncode(exercice))});

  //Ecrit la variable "json" dans un format qui poura être parse dans NodeJS
  String json = "[";
  for (int i = 0; i < listeExercicesString.length; i++) {
    if (i != (listeExercicesString.length - 1)) {
      json += listeExercicesString[i] + ",";
    } else {
      json += listeExercicesString[i];
    }
  }
  json += "]";

  dynamic body = {
    "courriel": utilisateur.courriel,
    "password": utilisateur.motDePasse,
    "liste_exercices": json
  };
  //json.encode(listeExercices())
  await post(urlAddExercices, body: body);

  
}
