

import 'package:bdebody/utilisateur.dart';
import 'package:flutter/material.dart';


import 'sexe.dart';
import 'dateDeNaissance.dart';

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
  String _name ;
  String _courriel;
  String _motDePasse;
  String _imc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      body: SafeArea(
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
      ),
    );
  }

  Widget formUI() {
    return new Column(
      children: <Widget>[
        new TextFormField(
          decoration: const InputDecoration(labelText: "Nom d'Utilisateur "),
          keyboardType: TextInputType.text,
          validator: validateName,
          onSaved: (String val) {
            _name = val;
          },
        ),
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Courriel'),
          keyboardType: TextInputType.emailAddress,
          validator: validateEmail,
          onSaved: (String val) {
            _courriel = val;
          },
        ),
        new SizedBox(
          height: 10.0,
        ),
        new TextFormField(
          decoration: const InputDecoration(
              labelText:
                  'Mot De Passe ( Au moins 1 majuscule,1minuscule,1 nombre et 1 caractère spécial)',
              labelStyle: TextStyle(fontSize: 10)),
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          validator: validatePassword,
          onSaved: (String val) {
            _motDePasse = val;
          },
        ),
        new SizedBox(
          height: 10.0,
        ),
        Sexe(),
        new SizedBox(
          height: 10.0,
        ),
        DateDeNaissance(),
        new SizedBox(
          height: 10.0,
        ),
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
      
        
        new SizedBox(
          height: 10.0,
        ),
        new RaisedButton(
          onPressed: _validateInputs,
          child: new Text('Valider'),
        )
      ],
    );
  }

  String validateName(String value) {
    if (value.length < 3)
      return 'Le nom doit avoir au moins 2 caractère';
    else
      return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Entrer un courriel valide';
    else
      return null;
  }

  String validatePassword(String value) {
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = new RegExp(pattern);
    print(value);
    if (value.isEmpty) {
      return 'Entrer un Mot de Passe';
    } else {
      if (!regex.hasMatch(value))
        return 'Entrer un mot de passe valide';
      else
        return null;
    }
  }

  void _validateInputs() {
    
    if (_formKey.currentState.validate()) {
     
      _formKey.currentState.save();
      _imc=( (double.parse(_poids) / (double.parse(_taille)/100 * double.parse(_taille)/100)).abs()).toString();
       Utilisateur utilisateur = Utilisateur( nom: _name,age:'10',courriel: _courriel,motDePasse: _motDePasse,poids: _poids,taille: _taille,imc:_imc);
      Navigator.pushReplacementNamed(context, '/menuProfil',arguments: {                               
                'nom': utilisateur.nom,'age':utilisateur.age,'courriel': utilisateur.courriel,'motDePasse': utilisateur.motDePasse,'poids':utilisateur.poids,'taille':utilisateur.taille,'imc':utilisateur.imc
      },);
     
//    If all data are correct then save data to out variables
      
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
