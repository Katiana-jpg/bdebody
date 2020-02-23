import 'package:flutter/material.dart';

import 'utilisateur.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'BdeBODY';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
<<<<<<< Updated upstream
      home: Menu_BdeBody(),
=======
      home: new Connexion(),
>>>>>>> Stashed changes
    );
  }
}

<<<<<<< Updated upstream
//
class Menu_BdeBody extends StatefulWidget {
  Menu_BdeBody({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/////////////////

class Accueil extends StatefulWidget {
  Accueil({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AccueilState();
}

class AccueilState extends State<Accueil> {
  Utilisateur utilisateur = new Utilisateur('Karl Elie ', 'Hien', 17, 58, 1.81);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: <Widget>[
      Row(children: <Widget>[
       
      ]),
      Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.amber,
            padding: EdgeInsets.all(20),
            child: Text('1'),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.blue,
            padding: EdgeInsets.all(20),
            child: Text('2'),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.green,
            padding: EdgeInsets.all(10),
            child: Text('3'),
          ),
        ),
      ]),
      Row(children: <Widget>[]),
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
    
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'NOM',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height : 10),
            Text(
              'Marc Antoine',
              style: TextStyle(
                color: Colors.lightBlueAccent,
                letterSpacing: 2.0,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height : 30),
            Text(
              'AGE',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height : 10),
            Text(
              '17',
              style: TextStyle(
                color: Colors.lightBlueAccent,
                letterSpacing: 2.0,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height : 30),
            Text(
              'POIDS',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height : 10),
            Text(
              '60 kg',
              style: TextStyle(
                color: Colors.lightBlueAccent,
                letterSpacing: 2.0,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
    );
    
    
    
  }
}

////////////////////

class _MyStatefulWidgetState extends State<Menu_BdeBody> {
  int _selectedIndex = 0;

  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text(
  //     'Accueil',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Calendrier',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Entraînements',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Suivi',
  //     style: optionStyle,
  //   ),
  //   Icon(Icons.star),
  // ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    StatefulWidget menuOuvert;

    switch (_selectedIndex) {
      case 0:
        menuOuvert = new Accueil();

        break;

      case 1:
        menuOuvert = new Calendrier();

        break;

      case 2:
        menuOuvert = new Calendrier();

        break;

      case 3:
        menuOuvert = new Calendrier();

        break;

      case 4:
        menuOuvert = new MenuProfil();

        break;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleSpacing: 3.0,
        title: const Text(
          'BdeBODY',
        ),
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
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
            icon: Icon(Icons.portrait),
            title: Text('Profil'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightBlueAccent,
        unselectedItemColor: Colors.grey[700],
        onTap: _onItemTapped,
      ),
    );
  }
}
=======

>>>>>>> Stashed changes
