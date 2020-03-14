import 'package:bdebody/CreationCompte/premièreUtilisation.dart';
import 'package:bdebody/chargement.dart';
import 'package:bdebody/connexion.dart';

import 'package:flutter/material.dart';
import 'ecranSeanceEntrainement.dart';
import 'menu/menusEntrainements/menuChoisirTypeEntrainement.dart';
import 'menu/accueil.dart';
import 'menu/calendrier.dart';
import 'menu/menusEntrainements/menuEntrainements.dart';
import 'menu/menusEntrainements/menuEntrainementsActuels.dart';
import 'menu/profil.dart';
import 'utilisateur.dart';
import 'chargement.dart';
void main() => runApp(MyApp());

Utilisateur utilisateur = new Utilisateur('Marc Antoine ', 'Hien', 17, 59, 181);

class MyApp extends StatelessWidget {
  static const String _title = 'BdeBODY';
   
  @override
  Widget build(BuildContext context) {

    return MaterialApp(title: _title, 
         initialRoute: '/',
         //Les routes pour passer d'un menu à l'autre

        routes: {
          '/': (context) => Chargement(),
          '/PremiereConnexion': (context) => Connexion(),
          '/home': (context) => WidgetPrincipal(),
          '/menuEntrainements': (context) => MenuEntrainements(),
          '/MenuEntrainementsActuels': (context) => MenuEntrainementsActuels(),
          '/menuProfil': (context) => MenuProfil(),

          '/MenuChoisirTypeEntrainements': (context) =>
              MenuChoisirTypeEntrainements(),
          '/ecranSeanceEntrainement': (context) => EcranSeanceEntrainement(), 

          
        });
  }
}


/**
 * Widget principal de l'application
 */
class WidgetPrincipal extends StatefulWidget {
  WidgetPrincipal({Key key}) : super(key: key);

  @override
  _WidgetPrincipalState createState() => _WidgetPrincipalState();
}

/////////////////

class _WidgetPrincipalState extends State<WidgetPrincipal> {
  int _selectedIndex = 2;

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
        menuOuvert = Chargement();

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
