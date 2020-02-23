import 'package:bdebody/Option_barre_navigation/accueil.dart';
import 'package:bdebody/Option_barre_navigation/calendrier.dart';
import 'package:bdebody/Option_barre_navigation/profil.dart';
import 'package:flutter/material.dart';

import '../connexion.dart';

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

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
    Connexion connexion = new Connexion();
    
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
        menuOuvert = new Connexion(); 

        break;

      case 4:
        menuOuvert = new MenuProfil();

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
  
  }}