import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:http/http.dart';

import '../main.dart';

class PremiereUtilisation extends StatefulWidget {
  PremiereUtilisation({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PremiereUtilisationState();
}

class PremiereUtilisationState extends State<PremiereUtilisation> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _poids;
  String _taille;
  String _imc;
  DateTime dateNaissance;
  int dateNaissanceMois;
  int dateNaissanceAnnee;
  int dateNaissanceJour;
  int genre = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        elevation : 0,
        title: SizedBox(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/logo.png",
                  fit: BoxFit.fill,
                  height: 50,
                ),
                SizedBox(width: 20),
                Text(
                  'Créer un compte',
                  style: TextStyle(fontSize: 20, wordSpacing: 6),
                )
              ]),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
              key: _formKey,
              autovalidate: _autoValidate,
              child: formUI(),
            ),
          ),
        ),
      )),
    );
  }

//Formulaire a remplir
  Widget formUI() {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15),
          child: new Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Radio(
                    value: 1,
                    groupValue: genre,
                    onChanged: (T) {
                      setState(() {
                        genre = T;
                        print(sexe(genre));
                      });
                    },
                  ),
                  SizedBox(
                    width: 18.0,
                  ),
                  Container(
                    width: 70.0,
                    child: Text(
                      "Homme",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Radio(
                    value: 2,
                    groupValue: genre,
                    onChanged: (T) {
                      setState(() {
                        genre = T;
                        print(sexe(genre));
                      });
                    },
                  ),
                  SizedBox(
                    width: 18.0,
                  ),
                  Container(
                    width: 70.0,
                    child: Text(
                      "Femme",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              new SizedBox(
                height: 50.0,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Text(
                          'Date de naissance',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.white),
                        ),SizedBox(width : 40),
                    IconButton(icon: Icon(Icons.calendar_today),color: Colors.blue, onPressed: () {
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(1900, 1, 1),
                              maxTime: DateTime(2020, 3, 9), onChanged: (date) {
                            print('change $date');
                          }, onConfirm: (date) {
                            setState(() {
                              dateNaissanceMois = date.month;
                              dateNaissance = date;
                              dateNaissanceAnnee = date.year;
                              dateNaissanceJour = date.day;
                              print('confirm $date');
                            });
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.fr);
                        },),
                     
                    Container(
                     padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      width: 90,
                      
                      
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[900]),
                      ),
                      child: Text(
                        (dateNaissance == null)
                            ? ''
                            : '$dateNaissanceAnnee/$dateNaissanceMois/$dateNaissanceJour',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.yellow[700]),
                      ),
                    ),
                  ]),
              new SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Poids',
                    style: TextStyle(color: Colors.white),
                  ),
                  LimitedBox(
                      maxWidth: 150,
                      child: Container(
                        padding : EdgeInsets.fromLTRB(40, 0, 20, 0),
                          child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        onChanged: (String str) {
                          _poids = str;
                        },
                      ))),
                  Text('kg', style: TextStyle(color: Colors.white)),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Taille',
                    style: TextStyle(color: Colors.white),
                  ),
                  LimitedBox(
                      maxWidth: 150,
                      child: Container(
                        padding : EdgeInsets.fromLTRB(40, 0, 20, 0),
                          child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        onChanged: (String str) {
                          _taille = str;
                        },
                      ))),
                  Text('cm', style: TextStyle(color: Colors.white)),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              new SizedBox(
                height: 10.0,
              ),
              new RaisedButton(
                color: Colors.yellow[700],
                onPressed: _validateInputs,
                child: new Text('Valider'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _imc = ((double.parse(_poids) /
                  (double.parse(_taille) / 100 * double.parse(_taille) / 100))
              .abs())
          .toStringAsFixed(2);
      utilisateur.age = calculateAge(dateNaissance);
      utilisateur.poids = _poids;
      utilisateur.taille = _taille;
      utilisateur.imc = _imc;
      utilisateur.genre = sexe(genre);
      Navigator.pushReplacementNamed(
        context,
        '/deuxiemePage',
      );

//    If all data are correct then save data to out variables
//    Envoie les donnée à la base de données
     // putUserData();
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }

  ///Calcul l'age de l'utlisateur en fonction de sa date de naissance
  calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age.toString();
  }

  sexe(int sexe) {
    return (sexe == 1) ? 'Male Alpha' : 'Femme';
  }
}

///Envoie les nouvelles valeurs à la base de données
void putUserData() async {
  String url = 'http://192.168.2.14:8080/update-user-data';

  String body = json.encode({
    "password": utilisateur.motDePasse,
    "courriel": utilisateur.courriel,
    "nom": utilisateur.nom,
    "age": int.parse(utilisateur.age),
    "taille": int.parse(utilisateur.taille),
    "poids": double.parse(utilisateur.poids),
    "genre": utilisateur.genre
  });

  Response response =
      await put(url, headers: {"Content-Type": "application/json"}, body: body);
  Map responseData = json.decode(response.body);
  print(responseData);
}
