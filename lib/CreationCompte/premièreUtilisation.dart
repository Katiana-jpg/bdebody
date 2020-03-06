
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'champsDeReponse.dart';
import 'sexe.dart';

class PremiereUtilisation extends StatefulWidget {
  PremiereUtilisation({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PremiereUtilisationState();
}

class PremiereUtilisationState extends State<PremiereUtilisation> {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _name;
  String _email;
  String _mobile;
  
  

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
              child: FormUI(),
            ),
          ),
        ),        
      ),
    );   
  }

  Widget FormUI() {
    return new Column(
      children: <Widget>[
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Nom'),
          keyboardType: TextInputType.text,
          validator: validateName,
          onSaved: (String val) {
            _name = val;
          },
        ),
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Numéro de Téléphone'),
          keyboardType: TextInputType.phone,
          validator: validateMobile,
          onSaved: (String val) {
            _mobile = val;
          },
        ),
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Courriel'),
          keyboardType: TextInputType.emailAddress,
          validator: validateEmail,
          onSaved: (String val) {
            _email = val;
          },
        ),
        new SizedBox(
          height: 10.0,
        ),
        Sexe(),
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

  String validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
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
  void _validateInputs() {  if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
    _formKey.currentState.save();
  } else {
//    If all data are not valid then start auto validation.
    setState(() {
      _autoValidate = true;
    });}
}
}