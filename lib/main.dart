import 'package:flutter/material.dart';

import 'utilisateur.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'BdeBODY';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}
//
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

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
  Utilisateur utilisateur =
      new Utilisateur('Marc Antoine ', 'Hien', 17, 58, 1.81);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'BIENVENUE ' + utilisateur.prenom + ' ' + utilisateur.nomFamille,
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
      ),
    );
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
        body: Center(
            child: Column(children: <Widget>[
      Row(children: <Widget>[
        // Image(
        //   image: NetworkImage(
        //       'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.arobasyk.com%2Fprise-en-main%2Fattachment%2Fandroid-logo%2F&psig=AOvVaw1Qz9wPUcUa6drOfRnotymK&ust=1582065939025000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKj-i4XV2ecCFQAAAAAdAAAAABAD'),
        // ),
      ]),
      Row(children: <Widget>[
        Text('Marc Antoine'),
      ]),
      Row(children: <Widget>[]),
    ])));
  }
}

////////////////////

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Accueil',
      style: optionStyle,
    ),
    Text(
      'Calendrier',
      style: optionStyle,
    ),
    Text(
      'Entraînements',
      style: optionStyle,
    ),
    Text(
      'Suivi',
      style: optionStyle,
    ),
    Icon(Icons.star),
  ];

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
      //    appBar: AppBar(

      //      title: const Text(

      //        'BdeBODY',

      //        ),

      //  ),

      body: Center(
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



