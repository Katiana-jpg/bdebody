import 'package:bdebody/nouvelObjectif.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:bdebody/main.dart';

class ChoixDeObjectif extends StatefulWidget {
  @override
  _ChoixDeObjectifState createState() => _ChoixDeObjectifState();
}

class Objectif {
  String name;
  Widget valeur;

  Objectif(this.name, this.valeur);

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

class _ChoixDeObjectifState extends State<ChoixDeObjectif> {
  List<Objectif> objectif = Objectif.getObjectif();
  List<DropdownMenuItem<Objectif>> _dropdownMenuItems;
  String objectifAttendu;
  String poidsVoulu;
  Objectif _selectedObjectif;
  DateTime dateNaissance;
  int dateNaissanceMois;
  int dateNaissanceAnnee;
  int dateNaissanceJour;
  bool _autovalidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(objectif);
    _selectedObjectif = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Objectif>> buildDropdownMenuItems(List choix) {
    List<DropdownMenuItem<Objectif>> items = List();
    for (Objectif obj in choix) {
      items.add(DropdownMenuItem(value: obj, child: Text(obj.name)));
    }
    return items;
  }

  onChangeDropdownItem(Objectif choixObjectif) {
    setState(() {
      _selectedObjectif = choixObjectif;
    });
  }

  String objectifValidation(String value) {
    if (_selectedObjectif == _dropdownMenuItems[0].value) {
      if (value.length == 0) {
        return 'veuillez entrez un nombre';
      }
      final poids = num.tryParse(value);
      if (poids == null) {
        return 'veuillez entrez un nombre valide';
      } else if (poids < 34 || poids > 275) {
        return '''            veuillez entrez un poids 
                entre 34 et 275 kg''';
      }
      poidsVoulu = value;
      return null;
    } else if (_selectedObjectif == _dropdownMenuItems[1].value) {
      if (value.length == 0) {
        return 'veuillez entrez un objectif';
      }
      objectifAttendu = value;
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
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text('Objectif de Départ'),
                                SizedBox(width: 20),
                                DropdownButton(
                                    style: TextStyle(
                                        fontSize: 9.5, color: Colors.black),
                                    value: _selectedObjectif,
                                    items: _dropdownMenuItems,
                                    onChanged: onChangeDropdownItem)
                              ],
                            ),
                            SizedBox(height: 25),
                            Divider(
                                height: 25, thickness: 5, color: Colors.black),
                            SizedBox(height: 20),
                            _selectedObjectif.valeur,
                            SizedBox(
                                width: 300,
                                height: 60,
                                child: TextFormField(
                                  validator: objectifValidation,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(0)),
                                      labelText:
                                          "Entrez votre objectif/ votre poids à obtenir",
                                      labelStyle: TextStyle(
                                          fontSize: 10,
                                          color: Colors.yellow[700])),
                                  keyboardType: TextInputType.text,
                                  onSaved: (String val) {},
                                )),
                            SizedBox(height: 20),
                            Divider(
                                height: 25, thickness: 5, color: Colors.black),
                            _dateDeFin(),
                            SizedBox(height: 25),
                            RaisedButton(
                                child: Text('Confirmer'),
                                onPressed: () {
                                  if (_selectedObjectif ==
                                      _dropdownMenuItems[0].value) {
                                    if (dateNaissanceJour == null) {
                                      Scaffold.of(context).showSnackBar(SnackBar(
                                          content: Text(
                                              "Veuillez entrez une date limite ",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          backgroundColor: Colors.red,
                                          duration: Duration(seconds: 1)));
                                    } else
                                      _validateInputs();
                                  } else if (_selectedObjectif ==
                                      _dropdownMenuItems[1].value) {
                                    if (dateNaissanceJour == null) {
                                      Scaffold.of(context).showSnackBar(SnackBar(
                                          content: Text(
                                              "Veuillez entrez une date limite ",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          backgroundColor: Colors.red,
                                          duration: Duration(seconds: 1)));
                                    } else
                                      _validateInputs();
                                  }
                                }),
                          ]))),
            )));
  }

  Widget _dateDeFin() {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      Text(
        "Date limite pour réussir l'objectif ",
        textAlign: TextAlign.start,
        style: TextStyle(color: Colors.black),
      ),
      SizedBox(width: 40),
      IconButton(
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
    ]);
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (_selectedObjectif == _dropdownMenuItems[0].value) {
        if (double.parse(poidsVoulu) < double.parse(utilisateur.poids)) {
          utilisateur.objectifUtilisateur = NouvelObjectif(
              date: dateNaissance.toString(),
              objectif: "Descendre jusqu'a $poidsVoulu KG");
        } else if (double.parse(poidsVoulu) ==
            double.parse(utilisateur.poids)) {
          utilisateur.objectifUtilisateur = NouvelObjectif(
              date: dateNaissance.toString(),
              objectif: "Rester à $poidsVoulu KG");
        } else
          utilisateur.objectifUtilisateur = NouvelObjectif(
              date: dateNaissance.toString(),
              objectif: "Monter jusqu'a $poidsVoulu KG");
      } else if (_selectedObjectif == _dropdownMenuItems[1].value) {
        utilisateur.objectifUtilisateur = NouvelObjectif(
            date: dateNaissance.toString(), objectif: objectifAttendu);
      }
      print(utilisateur.objectifUtilisateur.objectif);
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
