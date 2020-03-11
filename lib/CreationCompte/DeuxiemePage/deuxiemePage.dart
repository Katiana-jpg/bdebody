import 'package:bdebody/CreationCompte/Final/confirmation.dart';
import 'package:bdebody/utilisateur.dart';
import 'package:flutter/material.dart';

class DeuxiemePage extends StatefulWidget {
  @override
  _DeuxiemePageState createState() => _DeuxiemePageState();
}

class _DeuxiemePageState extends State<DeuxiemePage> {
  String _poids;
  String _taille;
  Map data ={};
  Map data2={};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    data2 = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.fromLTRB(15, 60, 15, 15),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Poids',
                    ),
                    LimitedBox(
                        maxWidth: 150,
                        child: Container(
                            child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          onChanged: (String str) {
                            _poids = str;
                          },
                        ))),
                    Text('KG'),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Taille',
                    ),
                    LimitedBox(
                        maxWidth: 150,
                        child: Container(
                            child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          onChanged: (String str) {
                            _taille = str;
                          },
                        ))),
                    Text('cm'),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  onPressed: () {
                    
                    Utilisateur utilisateur =
                        Utilisateur(poids: _poids, taille: _taille);
                        
                    data2 = {
                      'poids': utilisateur.poids,
                      'taille': utilisateur.taille
                    };
                    
                    data.addAll(data2);

                    Navigator.pushReplacementNamed(context, '/menuProfil',
                        arguments: (data));
                  },
                  child: new Text('Valider'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
