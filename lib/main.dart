import 'package:bdebody/connexion.dart';
import 'package:bdebody/menuEntrainements.dart';
import 'package:flutter/material.dart';
import 'utilisateur.dart';

void main() => runApp(MyApp());

Utilisateur utilisateur = new Utilisateur('Marc Antoine ', 'Hien', 17, 59, 181);

class MyApp extends StatelessWidget {
  static const String _title = 'BdeBODY';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: _title, home: MyStatefulWidget(),
        //initialRoute: '/home',
        //Ne vous souciez pas de `ca pour le moment je fais des test
        routes: {
          '/home': (context) => MyStatefulWidget(),
          '/MenuEntrainementsActuels' :(context) => MenuEntrainementsActuels(),
          '/menuEntrainements': (context) => MenuEntrainements(),
          '/menuProfil': (context) => MenuProfil(),
          '/MenuChoisirTypeEntrainements': (context) =>
              MenuChoisirTypeEntrainements(),
        });
  }
}

//

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/////////////////

class PremiereUtilisation extends StatefulWidget {
  PremiereUtilisation({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PremiereUtilisationState();
}

class PremiereUtilisationState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    Scaffold(
      body: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          child: FlatButton(
            child: Text('Soumettre'),
            onPressed: () {
//utilisateur.prenom = txtPrenom.onSubmitted(),
            },
          ),
        ),
      ]),
    );

    return null;
  }
}

/////////////////

class Accueil extends StatefulWidget {
  Accueil({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AccueilState();
}

class AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: <Widget>[
      Expanded(
        flex: 1,
        child: Container(
          color: Colors.yellowAccent,
          padding: EdgeInsets.all(20),
          child: TextField(
            decoration: InputDecoration(hintText: 'Entrez votre nom...'),
            onChanged: (String str) {
              utilisateur.prenom = str;
            },
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(
          
          color: Colors.yellowAccent[400],
          padding: EdgeInsets.all(20),
          child: TextField(
            decoration: InputDecoration(hintText: 'Entrez votre âge...'),
            onChanged: (String str) {
              utilisateur.age = int.parse(str);
            
            },
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(
          color: Colors.yellowAccent[700],
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(hintText: 'Entrez votre poids...'),
            onChanged: (String str) {
              utilisateur.poids = double.parse(str);
            },
          ),
        ),
      ),
      SizedBox(height: 50),
    ])));
  }
}

////////////////////

class Calendrier extends StatefulWidget {
  Calendrier({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CalendrierState();
}

class CalendrierState extends State<Calendrier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Text(
      'CALENDRIER',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    )));
  }
}

////////////////////

class MenuProfil extends StatefulWidget {
  MenuProfil({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MenuProfilState();
}

class MenuProfilState extends State<MenuProfil> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
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
            Row(children: <Widget>[
              Text(
                'NOM',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              )
            ]),
            SizedBox(height: 10),
            Text(
              utilisateur.prenom,
              style: TextStyle(
                color: Colors.yellowAccent[700],
                letterSpacing: 2.0,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
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
                    utilisateur.age.toString(),
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
                    utilisateur.poids.toString() + ' kg',
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
                    utilisateur.taille.toString() + ' cm',
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
                    utilisateur.imc.toStringAsFixed(2),
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
                    onPressed: () {},
                    child: new Icon(
                      Icons.edit,
                      color: Colors.black,
                      size: 25.0,
                    ),
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
  }
}

////////////////////

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    StatefulWidget menuOuvert = Accueil();

    switch (_selectedIndex) {
      case 0:
        menuOuvert = Connexion();

        break;

      case 1:
        menuOuvert = Calendrier();

        break;

      case 2:
        menuOuvert = MenuEntrainements();

        break;

      case 3:
        menuOuvert = Accueil();

        break;

      case 4:
        menuOuvert = MenuProfil();

        break;
    }

    return Scaffold(
      //resizeToAvoidBottomInset : false,
      // appBar: AppBar(
      //   centerTitle: true,
      //   titleSpacing: 3.0,
      //   title: const Text(
      //     'BdeBODY',
      //   ),
      //   backgroundColor: Colors.lightBlueAccent,
      //   elevation: 0.0,
      // ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 40),

        child: menuOuvert,

        //_widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Accueil'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Calendrier'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            title: Text('Entrainements'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            title: Text('Suivi'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profil'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.yellowAccent[700],
        unselectedItemColor: Colors.grey[700],
        onTap: _onItemTapped,
      ),
    );
  }
}
