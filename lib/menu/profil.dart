import 'package:bdebody/utilisateur.dart';
import 'package:flutter/material.dart';

import '../main.dart';

//import '../utilisateur.dart';

class MenuProfil extends StatefulWidget {
  final Map data;
  MenuProfil({Key key, this.data}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MenuProfilState();
}

class MenuProfilState extends State<MenuProfil> {
  Map data = MenuProfil().data;
  Utilisateur utilisateur;
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return SafeArea(
      // child:SingleChildScrollView(
      child: Scaffold(
        body: Column( 
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30),
            Text(
              'Profil',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            Row(
            children: <Widget>[
              
              Expanded(
                              child: Text(
                  'NOM',
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                              child: Text(
                  'Sexe',
                  style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2.0,
                  ),
                ),
              )
            ]),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
              Expanded(
                child: Text(
                data['nom'],
                style: TextStyle(
                  color: Colors.yellowAccent[700],
                  letterSpacing: 2.0,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
            ),
              ),
              SizedBox(width: 20),
            Expanded(
                          child: Text(
                data['genre'],
                style: TextStyle(
                  color: Colors.yellowAccent[700],
                  letterSpacing: 2.0,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )]),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'AGE',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Text(
                    'POIDS',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    data['age'],
                    style: TextStyle(
                      color: Colors.yellowAccent[700],
                      letterSpacing: 2.0,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Text(
                    data['poids'] + ' kg',
                    style: TextStyle(
                      color: Colors.yellowAccent[700],
                      letterSpacing: 2.0,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'TAILLE',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Text(
                    'IMC',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    data['taille'] + ' cm',
                    style: TextStyle(
                      color: Colors.yellowAccent[700],
                      letterSpacing: 2.0,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Text(
                    data['imc'],
                    style: TextStyle(
                      color: Colors.yellowAccent[700],
                      letterSpacing: 2.0,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[

                RaisedButton(
                  color: Colors.yellowAccent[700],
                  onPressed: () {
                    Navigator.pushNamed(context, '/premiereUtilisation');
                  },
                  child: new Icon(
                    Icons.edit,
                    color: Colors.black,
                    size: 25.0,

                
                
                  
                  
                  
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  //fillColor: Colors.white,
                  padding: const EdgeInsets.all(15.0),
                ),
              ],
            )
          ],
        ),
      ),
    );
    //  );
  }
}
