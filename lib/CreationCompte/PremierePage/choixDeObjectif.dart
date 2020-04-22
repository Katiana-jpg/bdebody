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
    return <Objectif>[
      Objectif(
          'Perte de poids/Augmentation de la masse musculaire',
          Row(
            children: <Widget>[
              Text('Poids obtenir :'),
              SizedBox( width : 80),
              SizedBox(
                  width: 100,
                  height: 30,
                  child: TextFormField(
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
                  height: 30,
                  child: TextFormField(
                    style: TextStyle( color: Colors.black),
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
      
      child: Scaffold(backgroundColor: Colors.grey[800],
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
          body: Builder(
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
                          style: TextStyle(fontSize: 9.5, color:Colors.black ),
                            value: _selectedObjectif,
                            items: _dropdownMenuItems,
                            onChanged: onChangeDropdownItem)
                      ],
                    ),
                   SizedBox( height : 25),
                   
                    Divider(
                      height: 25,
                      thickness: 5,
                      color: Colors.black
                    ), SizedBox( height : 20),
                    _selectedObjectif.valeur,
                    SizedBox( height : 20),Divider(
                      height: 25,
                      thickness: 5,
                      color: Colors.black
                    ),
                    _dateDeFin(),
                    SizedBox( height : 25),
                    RaisedButton(
                              child: Text('Confirmer'),
                              onPressed: () {
                               if(_selectedObjectif == _dropdownMenuItems[0].value){

if( dateNaissanceJour == null ||_selectedObjectif.valeur == null ){
 Scaffold.of(context).showSnackBar(SnackBar(content : Text("Veuillez entrez un poids et une date limite ",style:TextStyle(color : Colors.white)), backgroundColor: Colors.red,));
} else
                                Navigator.pushReplacementNamed(
                                    context, '/home');
                               }
                               else if(_selectedObjectif == _dropdownMenuItems[1].value){

if( dateNaissanceJour == null ||_selectedObjectif.valeur == null ){
 Scaffold.of(context).showSnackBar(SnackBar(content : Text("Veuillez entrez un Objectif et une date limite ",style:TextStyle(color : Colors.white)), backgroundColor: Colors.red,));
} else
                                Navigator.pushReplacementNamed(
                                    context, '/home');
                               }
                                   
                               
                              }),
                  ]))),
    ));
  }
  Widget _dateDeFin() {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[Text(
                          "Date limite pour réussir l'objectif ",
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.black),
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
                  ]);
  }
}
