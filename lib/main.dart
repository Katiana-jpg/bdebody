import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'CreationCompte/premiereUtilisationPage1.dart';
import 'CreationCompte/premiereUtilisationPage2.dart';
import 'package:bdebody/CreationCompte/premiereUtilisationPage3_1.dart';
import 'package:bdebody/CreationCompte/premiereUtilisationPage3_2.dart';
import 'package:bdebody/CreationCompte/premiereUtilisationPage4.dart';


import 'package:bdebody/connexion.dart';
import 'package:bdebody/graphiquePoids.dart';
import 'graphiquePoids.dart';


import 'utilisateur.dart';
import 'package:bdebody/menu/graphique2.dart';
import 'package:bdebody/chargement.dart';
import 'package:bdebody/connexion.dart';

import 'menu/menusEntrainements/menuEntrainements.dart';
import 'menu/menusEntrainements/menuEntrainementsActuels.dart';
import 'menu/menusEntrainements/menuChoisirTypeEntrainement.dart';

import 'ecranSeanceEntrainement.dart';
import 'menu/accueil.dart';
import 'menu/calendrier.dart';
import 'menu/profil.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

//Les valeur par defaut servent juste à accélerer les tests

Utilisateur utilisateur = new Utilisateur(
    nom: 'marc',
    age: '17',
    taille: '100',
    poids: '69',
    courriel: 'marcantoine@yahoo.com',
    imc: '99',
    motDePasse: 'marc',
    genre: 'Male');

class MyApp extends StatelessWidget {
  static const String _title = 'BdeBODY';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: _title, initialRoute: 'PremiereConnexion',
        //Les routes pour passer d'un menu à l'autre

        routes: {
          '/': (context) => Chargement(),
          '/PremiereConnexion': (context) => Connexion(),
          '/home': (context) => WidgetPrincipal(),
          '/menuEntrainements': (context) => MenuEntrainements(),
          '/MenuEntrainementsActuels': (context) => MenuEntrainementsActuels(),
          '/menuProfil': (context) => MenuProfil(),
          '/premiereUtilisationPage1': (context) => PremiereUtilisationPage1(),
          '/premiereUtilisationPage2': (context) => PremiereUtilisationPage2(),
          '/premiereUtilisationPage3_1': (context) =>
              PremiereUtilisationPage3_1(),
          '/premiereUtilisationPage3_2': (context) =>
              PremiereUtilisationPage3_2(),
          '/premiereUtilisationPage4': (context) => PremiereUtilisationPage4(),
          '/MenuChoisirTypeEntrainements': (context) =>
              MenuChoisirTypeEntrainements(),
          '/ecranSeanceEntrainement': (context) => EcranSeanceEntrainement(),
        });
  }
}

/// Widget principal de l'application

class WidgetPrincipal extends StatefulWidget {
  WidgetPrincipal({Key key}) : super(key: key);

  @override
  _WidgetPrincipalState createState() => _WidgetPrincipalState();
}

///////////////////

class _WidgetPrincipalState extends State<WidgetPrincipal> {
  int _selectedIndex = 2;
  Map data = {};
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

    StatefulWidget menuOuvert = Accueil();

    switch (_selectedIndex) {
      case 0:
        menuOuvert = GraphiquePoids();

        break;

      case 1:
        menuOuvert = Calendrier();

        break;

      case 2:
        menuOuvert = MenuEntrainements();

        break;

      case 3:
        menuOuvert = Calendrier();

        break;

      case 4:
        menuOuvert = MenuProfil();

        break;
    }

    return Scaffold(
      body: menuOuvert,

      //_widgetOptions.elementAt(_selectedIndex),

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
