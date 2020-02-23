import 'package:flutter/material.dart';

class MenuEntrainements extends StatefulWidget {
  @override
  _MenuEntrainementsState createState() => _MenuEntrainementsState();
}

class _MenuEntrainementsState extends State<MenuEntrainements> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: <Widget>[
          Expanded(
            
            child: RaisedButton(
              color: Colors.red,
              elevation: 0.5,
              onPressed: null,
              child: Row(children: <Widget>[
                SizedBox(width: 20),
                Icon(Icons.fitness_center),
                SizedBox(width: 20),
                Text('Entrainements actuels',),
                ]),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(25),
                  

            ),
          )
        ),
        SizedBox(height : 20),
        Expanded(
            child: RaisedButton(
              color: Colors.red,
              elevation: 20,
              onPressed: null,
              child: Row(
                
                children: <Widget>[
                Icon(Icons.add_circle,),
                SizedBox(width: 20),
                Text('Créer nouvel entraînement',
                ),
                ]),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(25),
                  

            ),
          )
        )],
      ),
    ));
  }
}
