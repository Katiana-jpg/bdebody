import 'package:bdebody/main.dart';
import 'package:bdebody/nouvelObjectif.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class ChoixDeObjectif extends StatefulWidget {
  @override
  _ChoixDeObjectifState createState() => _ChoixDeObjectifState();
}

class Objectif {
  String name;
  Widget valeur;
  

  Objectif(this.name, this.valeur);

  static List<Objectif> getObjectif() {
    String poidsValidation(String value) {
      
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
      return null;
    }

    String objectifValidation(String value) {
      if (value.length == 0) {
        return 'veuillez entrez un objectif';
      }

      return null;
    }

    return <Objectif>[
      Objectif(
          'Perte de poids/Augmentation de la masse musculaire',
          Row(
            children: <Widget>[
              Text('Poids obtenir :'),
              SizedBox(width: 50),
              SizedBox(
                  width: 250,
                  height: 70,
                  child: TextFormField(
                    validator: poidsValidation,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0)),
                        labelText: "poids ",
                        labelStyle:
                            TextStyle(fontSize: 10, color: Colors.yellow[700])),
                    keyboardType: TextInputType.number,
                    onSaved: (String val) {
                     
                    },
                  ))
            ],
          )),
      Objectif(
          'Autre',
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  width: 300,
                  height: 60,
                  child: TextFormField(
                    validator: objectifValidation,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0)),
                        labelText: "Entrez votre objectif",
                        labelStyle:
                            TextStyle(fontSize: 10, color: Colors.yellow[700])),
                    keyboardType: TextInputType.text,
                    onSaved: (String val) {},
                  ))
            ],
          ))
    ];
  }
}

class _ChoixDeObjectifState extends State<ChoixDeObjectif> {
  List<Objectif> objectif = Objectif.getObjectif();
  List<DropdownMenuItem<Objectif>> _dropdownMenuItems;
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
    print(_selectedObjectif );
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if(_selectedObjectif== _dropdownMenuItems[0].value){
           if(double.parse(_selectedObjectif.valeur.toString() ) < 10.0){
print('allo');
NouvelObjectif(date: dateNaissance.toString(),objectif:'Perdre $_selectedObjectif.toString() KG'  );
           } else print('bye'); NouvelObjectif(date: dateNaissance.toString(),objectif:'Gagner $_selectedObjectif.toString() KG'  );
      }
      else if(_selectedObjectif== _dropdownMenuItems[1].value){
 NouvelObjectif(date: dateNaissance.toString(),objectif:_selectedObjectif.toString()  );
      }
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
