import 'package:bdebody/menu/accueil.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class PremiereUtilisation extends StatefulWidget {
  PremiereUtilisation({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PremiereUtilisationState();
}

class PremiereUtilisationState extends State<PremiereUtilisation> {
  int _currentValue = 0;
  void _showDialog() {
    showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return new NumberPickerDialog.integer(
            minValue: 0,
            maxValue: 100,
            title: new Text("Choissisez un âge"),
            initialIntegerValue: _currentValue,
          );
        }).then((int value) {
      if (value != null) {
        setState(() => _currentValue = value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final prenom = Text('Prénom',
        style: TextStyle(
          letterSpacing: 2.0,
          fontSize: 14.0,
        ));
    final prenomTexte = TextField(
      obscureText: false,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final nom = Text('Nom',
        style: TextStyle(
          letterSpacing: 2.0,
          fontSize: 14.0,
        ));
    final nomTexte = TextField(
      obscureText: false,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final age = Text('Âge',
        style: TextStyle(
          letterSpacing: 2.0,
          fontSize: 14.0,
        ));
    final ageActuel = Text('$_currentValue',
        style: TextStyle(
          letterSpacing: 2.0,
          fontSize: 14.0,
        ));

    final courriel = Text('Courriel',
        style: TextStyle(
          letterSpacing: 2.0,
          fontSize: 14.0,
        ));
    final courrieltexte = TextField(
      obscureText: false,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final motDePasse = Text('Mot de passe',
        style: TextStyle(
          letterSpacing: 2.0,
          fontSize: 14.0,
        ));
    final motDePasseTexte = TextField(
      obscureText: true,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final motDePasseConfirme = Text('Confirmer Mot de passe',
        style: TextStyle(
          letterSpacing: 2.0,
          fontSize: 14.0,
        ));
    final motDePasseConfirmeTexte = TextField(
      obscureText: true,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final boutonContinuer = Material(
      elevation: 5.0,
      color: Colors.black,
      child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          child: Text(
            "Continuer",
            style: TextStyle(color: Colors.yellowAccent),
            textAlign: TextAlign.center,
          )),
    );
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      body: SafeArea(
          child: SingleChildScrollView(
              child: Container(
                  child: Center(
        child: Column(children: <Widget>[
          SizedBox(height: 50.0),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                prenom,
                Container(width: 200, child: prenomTexte)
              ]),
          SizedBox(height: 50.0),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[nom, Container(width: 200, child: nomTexte)]),
          SizedBox(height: 50.0),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                age,
                ageActuel,
                Container(
                    width: 100,
                    child: RaisedButton(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Text('modifier'),
                      onPressed: _showDialog,
                    ))
              ]),
          SizedBox(height: 50.0),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                courriel,
                Container(width: 200, child: courrieltexte)
              ]),
          SizedBox(height: 50.0),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                motDePasse,
                Container(width: 200, child: motDePasseTexte)
              ]),
          SizedBox(height: 50.0),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                motDePasseConfirme,
                Container(width: 200, child: motDePasseConfirmeTexte)
              ]),
          SizedBox(height: 50.0),
          Container(child: boutonContinuer),
        ]),
      )))),
    );
  }
}
