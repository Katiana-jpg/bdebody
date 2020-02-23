import 'package:flutter/material.dart';

class MenuEntrainements extends StatefulWidget {
  @override
  _MenuEntrainementsState createState() => _MenuEntrainementsState();
}

class _MenuEntrainementsState extends State<MenuEntrainements> {
  @override
  Widget build(BuildContext context) {
    return Container(
        
        margin: EdgeInsets.fromLTRB(5,25,5,100),
        child: Column(
          children: <Widget>[
           Text('Entrainements',
             textAlign : TextAlign.left,
            
            style: TextStyle(
              color: Colors.black,
              letterSpacing: 2.0,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height : 20),
          Expanded(
            
            child: RaisedButton(
              color: Colors.redAccent[400],
              elevation: 15,
              onPressed: (){},
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
              color: Colors.redAccent[400],
              elevation: 15,
              onPressed: (){
                
                Navigator.pushNamed(context, '/MenuChoisirTypeEntrainements');
                
                },
              
              
              child: Row(
                
                children: <Widget>[
                SizedBox(width: 20),
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
    );
  }
}


class MenuChoisirTypeEntrainements extends StatefulWidget {
  @override
  _MenuChoisirTypeEntrainementsState createState() => _MenuChoisirTypeEntrainementsState();
}

class _MenuChoisirTypeEntrainementsState extends State<MenuChoisirTypeEntrainements> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: false,
        //titleSpacing: 3.0,
        title: const Text(
          "Sélectionner un type d'entraînement",
        ),
        backgroundColor: Colors.redAccent[400],
        elevation: 2.0,
      ), 
      body: Container(
        
        margin: EdgeInsets.fromLTRB(5,25,5,100),
        child: Column(
          children: <Widget>[
          //  Text('Entrainements',
          //    textAlign : TextAlign.left,
            
          //   style: TextStyle(
          //     color: Colors.black,
          //     letterSpacing: 2.0,
          //     fontSize: 28,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          SizedBox(height : 20),
          
          Expanded(
            
            child: RaisedButton(
              color: Colors.redAccent[400],
              elevation: 15,
              onPressed: (){},
              child: Row(children: <Widget>[
                SizedBox(width: 20),
                Icon(Icons.fitness_center),
                SizedBox(width: 20),
                Text('Musculation',),
                ]),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(25),
                  

            ),
          )
        ),
        SizedBox(height : 20),
        Expanded(
            child: RaisedButton(
              color: Colors.redAccent[400],
              elevation: 15,
              onPressed: (){
                },
              
              
              child: Row(
                
                children: <Widget>[
                SizedBox(width: 20),
                Icon(Icons.healing,),
                SizedBox(width: 20),
                Text('Cardio',
                ),
                ]),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(25),
                  

            ),
          )
        ),
        SizedBox(height : 20),
        Expanded(
            
            child: RaisedButton(
              color: Colors.redAccent[400],
              elevation: 15,
              onPressed: (){},
              child: Row(children: <Widget>[
                SizedBox(width: 20),
                Icon(Icons.thumb_up),
                SizedBox(width: 20),
                Text('Flexibilité',),
                ]),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(25),
                  

            ),
          )
        ),
        SizedBox(height : 20),
        ],
      ),
    ));
  }
}