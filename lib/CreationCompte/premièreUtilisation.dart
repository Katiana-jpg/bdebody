
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



    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      body: SafeArea(
          child: SingleChildScrollView(
              
                  
        child: Container(
          child:Row(
          children: <Widget>[
                          Container(
                  padding: EdgeInsets.only(top: 50.0, right: 10.0, left: 10.0, bottom: 40.0),
                  child: Column(
                    children: <Widget>[
                      
                      //InputField Widget from the widgets folder
                      ChampsDeReponse(
                        information: "Prénom",
                      information_Client: "Vincent"
                      ),

                      SizedBox(height: 20.0),
 ChampsDeReponse(
                        information: "Nom",
                      information_Client: "Richard"
                      ),SizedBox(height: 20.0),
                      //Gender Widget from the widgets folder
                      Sexe(),

                      


                      //InputField Widget from the widgets folder
                      


                      SizedBox(height: 20.0),

                      
                      //InputField Widget from the widgets folder
                      ChampsDeReponse(
                        information: "Courriel",
                      information_Client: "Bob@gmail.com"
                      ),

                      SizedBox(height: 20.0),

                    

                      ChampsDeReponse(
                        information: "Mot de passe",
                      information_Client: ""
                      ),


                      SizedBox(height: 20.0),

                      //InputField Widget from the widgets folder
                      ChampsDeReponse(
                        information: "Mot de Passe",
                      information_Client: ""
                      ),


                      SizedBox(height: 40.0,),
                      
                     
                    
                      
                      SizedBox(height: 40.0,),

                      Row(
                        children: <Widget>[
                          SizedBox(width: 170.0,),
                          FlatButton(
                            color: Colors.grey[200],
                            onPressed: (){},
                            child: Text(
                              "Cancel"
                            ),
                          ),

                          SizedBox(width: 20.0,),

                          FlatButton(
                            color: Colors.greenAccent,
                            onPressed: (){},
                            child: Text(
                              "Save",
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
             
             ) ])),
    )));
  }
}
