import 'dart:convert';
import 'dart:ffi';

import 'package:bdebody/main.dart';
import 'package:bdebody/utilisateur.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../entrainement.dart';
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

  List<int> _currentIndexes = [0, 0, 0];

  _onChanged(int bouton) {
    //update with a new color when the user taps button
    int _colorCount = _colors.length;

    setState(() {
      if (_currentIndexes.elementAt(bouton) == _colorCount - 1) {
        _currentIndexes[bouton] = 0;
      } else {
        _currentIndexes[bouton] += 1;
      }
    });

    //setState(() => (_currentIndex == _colorCount - 1) ? _currentIndex = 1 : _currentIndex += 1);
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
        body: AnimatedContainer(
          margin: EdgeInsets.fromLTRB(20, 25, 20, 100),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Expanded(
                  child: RaisedButton(
                color: _colors[_currentIndexes[0]],
                splashColor: Colors.red,
                elevation: 15,
                onPressed: () {
                  if (listeMuscles.contains("Bras")) {
                    listeMuscles.remove("Bras");
                  } else {
                    listeMuscles.add("Bras");
                  }
                  listeMuscles.forEach((string) => print(string));
                  _onChanged(0);
                },
                child: Row(children: <Widget>[
                  SizedBox(width: 20),
                  Icon(
                    Icons.add_circle,
                    color: Colors.black,
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Bras',
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 2.0,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(25),
                ),
              )),
              SizedBox(height: 20),
              Expanded(
                  child: RaisedButton(
                color: _colors[_currentIndexes[1]],
                splashColor: Colors.red,
                elevation: 15,
                onPressed: () {
                  if (listeMuscles.contains("Torse")) {
                    listeMuscles.remove("Torse");
                  } else {
                    listeMuscles.add("Torse");
                  }
                  listeMuscles.forEach((string) => print(string));
                  _onChanged(1);
                },
                child: Row(children: <Widget>[
                  SizedBox(width: 20),
                  Icon(
                    Icons.add_circle,
                    color: Colors.black,
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Torse',
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 2.0,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(25),
                ),
              )),
              SizedBox(height: 20),
              Expanded(
                  child: RaisedButton(
                color: _colors[_currentIndexes[2]],
                splashColor: Colors.red,
                elevation: 15,
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
                child: Row(children: <Widget>[
                  SizedBox(width: 20),
                  Icon(
                    Icons.add_circle,
                    color: Colors.black,
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Jambes',
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 2.0,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(25),
                ),
              )),
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
                    onPressed: () {
                      //Navigator.pushNamed(context, '/home');
                      creerEntrainement(listeMuscles);
                      //listeMuscles.clear();
                    },
                    child: Text(
                      "Créer l'entrainement",
                      textAlign: TextAlign.center,
                    )),
              )
            ],
          ),
          duration: Duration(milliseconds: 2000),
        ));
  }
}

void creerEntrainement(List<String> listeMuscles) async {
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
  List<Exercice> exercicesPourEntrainement = new List<Exercice>();

//ajoute les exercices qui ciblent les bon muscles à l'entrainement
  utilisateur.exercicesDeBase.forEach((exercice) => {
        listeMuscles.forEach((muscle) => {
              if (exercice.description.contains(muscle) &&
                  !exercicesPourEntrainement.contains(exercice))
                {exercicesPourEntrainement.add(exercice)}
            })
      });

  //Entrainement entrainement = new Entrainement(nomEntrainement: "nom test", exercices: exercicesPourEntrainement);

  //crée l'entrainement et l'ajoute à la liste des entrainement
  utilisateur.listeEntrainements.add(new Entrainement(
      nomEntrainement: "Premier entrainement",
      exercices: exercicesPourEntrainement));
  String urlAddEntrainement = "http://192.168.2.14:8080/add-entrainement";

  await post(urlAddEntrainement, body: {
    "courriel": utilisateur.courriel,
    "password": utilisateur.motDePasse,
    "nomEntrainement": utilisateur.listeEntrainements
        .elementAt(utilisateur.listeEntrainements.length - 1)
        .nomEntrainement
  });

  String urlAddExercices =
      "http://192.168.2.14:8080/add-exercices-entrainement";
  List<Map<String, dynamic>> listeExercices = List<Map<String, dynamic>>();
//pour chaque exercice du dernier entrainement, ajoute un objet JSON à la liste_exercices à envoyer dans le server
  utilisateur.listeEntrainements
      .elementAt(utilisateur.listeEntrainements.length - 1)
      .exercices
      .forEach((exercice) => {
            listeExercices.add(exercice.toMap(utilisateur.listeEntrainements
                .elementAt(utilisateur.listeEntrainements.length - 1)
                .nomEntrainement))
          });

  print(listeExercices);

  List<String> listeExercicesString = new List<String>();
  listeExercices
      .forEach((exercice) => {listeExercicesString.add(jsonEncode(exercice))});

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
