import 'package:bdebody/nouvelObjectif.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:bdebody/main.dart';
import 'package:http/http.dart';

///Quatrième page de la première utilisation
class PremiereUtilisationPage4 extends StatefulWidget {
  @override
  _PremiereUtilisationPage4State createState() =>
      _PremiereUtilisationPage4State();
}

///Présente les objectifs à l'utilisateur
class Objectif {
  String nomObjectif;
  Widget valeurObjectif;

  Objectif(this.nomObjectif, this.valeurObjectif);

  static List<Objectif> getObjectif() {
    return <Objectif>[
      Objectif(
        'Perte de poids/Augmentation de la masse musculaire',
        Container(
          child: Text(
            'Poids obtenir :',
          ),
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        ),
      ),
      Objectif(
        'Autre',
        Container(
          child: Text('Objectif à accomplir : '),
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        ),
      ),
    ];
  }
}

///Définit l'état d'une instance de [PremiereUtilisationPage4]
class _PremiereUtilisationPage4State extends State<PremiereUtilisationPage4> {
  List<Objectif> objectif = Objectif.getObjectif();
  List<DropdownMenuItem<Objectif>> _choixObjectif;
  String objectifAttendu;
  String poidsVoulu;
  Objectif _objectifchoisi;
  DateTime dateNaissance;
  int dateNaissanceMois;
  int dateNaissanceAnnee;
  int dateNaissanceJour;
  bool _autovalidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _choixObjectif = buildDropdownMenuItems(objectif);
    _objectifchoisi = _choixObjectif[0].value;
    super.initState();
  }

/// Retourne les possibles choix d'objectifs présent dans la liste d'objectif [choix]
  List<DropdownMenuItem<Objectif>> buildDropdownMenuItems(List choix) {
    List<DropdownMenuItem<Objectif>> items = List();
    for (Objectif objectif in choix) {
      items.add(DropdownMenuItem(value: objectif, child: Text(objectif.nomObjectif)));
    }
    return items;
  }
/// Change l'Item/Objectif prit par l'utilisateur avec le nouvel objectif choisi [choixObjectif]
  onChangeDropdownItem(Objectif choixObjectif) {
    setState(() {
      _objectifchoisi = choixObjectif;
    });
  }
/// Verification de l'objectif [valeurObjectif]
  String objectifValidation(String valeurObjectif) {
    if (_objectifchoisi == _choixObjectif[0].value) {
      if (valeurObjectif.length == 0) {
        return 'veuillez entrez un nombre';
      }
      final poids = num.tryParse(valeurObjectif);
      if (poids == null) {
        return 'veuillez entrez un nombre valide';
      } else if (poids < 34 || poids > 275) {
        return '''            veuillez entrez un poids 
                entre 34 et 275 kg''';
      }
      poidsVoulu = valeurObjectif;
      return null;
    } else if (_objectifchoisi == _choixObjectif[1].value) {
      if (valeurObjectif.length == 0) {
        return 'veuillez entrez un objectif';
      }
      objectifAttendu = valeurObjectif;
      return null;
    }
    return 'woattt';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.grey[800],
            appBar: AppBar(
              elevation: 0,
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
            body: Form(
              key: _formKey,
              autovalidate: _autovalidate,
              child: Builder(
                  builder: (context) => Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ListView(children: <Widget>[
                        Container(
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 30),
                              Text(
                                'Objectif de Départ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Container(
                                child: DropdownButton(
                                    style: TextStyle(
                                        fontSize: 9.5, color: Colors.amber),
                                    value: _objectifchoisi,
                                    items: _choixObjectif,
                                    onChanged: onChangeDropdownItem),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 25),
                        Divider(height: 25, thickness: 5, color: Colors.black),
                        SizedBox(height: 20),
                        _objectifchoisi.valeurObjectif,
                        SizedBox(
                            width: 300,
                            height: 60,
                            child: TextFormField(
                              validator: objectifValidation,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(0)),
                                  labelText:
                                      "Entrez votre objectif/ votre poids à obtenir",
                                  labelStyle: TextStyle(
                                      fontSize: 10, color: Colors.yellow[700])),
                              keyboardType: TextInputType.text,
                              onSaved: (String val) {},
                            )),
                        SizedBox(height: 20),
                        Divider(height: 25, thickness: 5, color: Colors.black),
                        _dateDeFin(),
                        SizedBox(height: 25),
                        RaisedButton(
                            child: Text('Confirmer'),
                            onPressed: () {
                              if (_objectifchoisi ==
                                  _choixObjectif[0].value) {
                                if (dateNaissanceJour == null) {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text(
                                          "Veuillez entrez une date limite ",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      backgroundColor: Colors.red,
                                      duration: Duration(seconds: 1)));
                                } else
                                  _validationDesDonneesEntree();
                              } else if (_objectifchoisi ==
                                  _choixObjectif[1].value) {
                                if (dateNaissanceJour == null) {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text(
                                          "Veuillez entrez une date limite ",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      backgroundColor: Colors.red,
                                      duration: Duration(seconds: 1)));
                                } else
                                  _validationDesDonneesEntree();
                              }
                            }),
                      ]))),
            )));
  }

  /// Composante qui prend la valeur de la date prévu pour avoir complété son objectif
  Widget _dateDeFin() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Date limite pour réussir l'objectif ",
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.0),
                  color: Colors.white,
                ),
                child: IconButton(
                  icon: Icon(Icons.calendar_today),
                  color: Colors.blue,
                  onPressed: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: new DateTime.now(),
                        maxTime: DateTime(2021, 12, 31), onChanged: (date) {
                      print('change $date');
                    }, onConfirm: (date) {
                      setState(() {
                        dateNaissanceMois = date.month;
                        dateNaissance = date;
                        dateNaissanceAnnee = date.year;
                        dateNaissanceJour = date.day;
                        print('confirm $date');
                      });
                    }, currentTime: DateTime.now(), locale: LocaleType.fr);
                  },
                ),
              ),
              SizedBox(width: 50),
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
            ],
          ),
        ]);
  }

  ///Verification pour voir si chaque valeur entree a ete validé
  void _validationDesDonneesEntree() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (_objectifchoisi == _choixObjectif[0].value) {
        if (double.parse(poidsVoulu) < double.parse(utilisateur.poids)) {
          utilisateur.objectifUtilisateur = NouvelObjectif(
              objectif: "Descendre jusqu'a $poidsVoulu KG",
              siObjectifPoids: true,
              objectifPoids: double.parse(poidsVoulu),
              debutObjectif: DateTime.now(),
              finObjectif: dateNaissance);
        } else if (double.parse(poidsVoulu) ==
            double.parse(utilisateur.poids)) {
          utilisateur.objectifUtilisateur = NouvelObjectif(
              objectif: "Rester à $poidsVoulu KG",
              siObjectifPoids: true,
              objectifPoids: double.parse(poidsVoulu),
              debutObjectif: DateTime.now(),
              finObjectif: dateNaissance);
        } else
          utilisateur.objectifUtilisateur = NouvelObjectif(
              objectif: "Monter jusqu'a $poidsVoulu KG",
              siObjectifPoids: true,
              objectifPoids: double.parse(poidsVoulu),
              debutObjectif: DateTime.now(),
              finObjectif: dateNaissance);
      } else if (_objectifchoisi == _choixObjectif[1].value) {
        utilisateur.objectifUtilisateur = NouvelObjectif(
            objectif: objectifAttendu,
            siObjectifPoids: false,
            objectifPoids: 0,
            debutObjectif: DateTime.now(),
            finObjectif: dateNaissance);
      }
      print(utilisateur.objectifUtilisateur.objectif);
      await postObjectif();
      Navigator.pushReplacementNamed(
        context,
        '/home',
      );
    } else {
      setState(() {
        _autovalidate = true;
      });
    }
  }
}

///Ajoute l'objectif créé dans la base de données
Future postObjectif() async {
  String url = 'http://' + host + ':8080/create-objectif/';
  dynamic body = {
    "password": utilisateur.motDePasse,
    "courriel": utilisateur.courriel,
    "siObjectifPoids":
        utilisateur.objectifUtilisateur.siObjectifPoids.toString(),
    "finObjectif": utilisateur.objectifUtilisateur.finObjectif.toString(),
    "debutObjectif": utilisateur.objectifUtilisateur.debutObjectif.toString(),
    "objectif": utilisateur.objectifUtilisateur.objectif,
    "poidsCible": utilisateur.objectifUtilisateur.objectifPoids.toString()
  };
  await post(url, body: body);
}
