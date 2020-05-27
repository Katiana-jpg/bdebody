import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'CreationCompte/premiereUtilisationPage1.dart';
import 'CreationCompte/premiereUtilisationPage2.dart';
import 'package:bdebody/CreationCompte/premiereUtilisationPage3_1.dart';
import 'package:bdebody/CreationCompte/premiereUtilisationPage3_2.dart';
import 'package:bdebody/CreationCompte/premiereUtilisationPage4.dart';
import 'package:bdebody/connexion.dart';
import 'package:bdebody/menu/graphiquePoids.dart';
import 'heureDisponible.dart';
import 'menu/graphiquePoids.dart';
import 'package:bdebody/menu/menusEntrainements/menuSelectionMuscles.dart';
import 'menu/menusEntrainements/menuChoixDispo.dart';
import 'utilisateur.dart';
import 'package:bdebody/chargement.dart';
import 'ecranSeanceEntrainement.dart';
import 'menu/menusEntrainements/menuEntrainements.dart';
import 'menu/menusEntrainements/menuEntrainementsActuels.dart';
import 'menu/menusEntrainements/menuChoisirTypeEntrainement.dart';
import 'menu/profil.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}


Utilisateur utilisateur = new Utilisateur();
//addresse ip du server NodeJS
String host = "192.168.2.14";

///Plage horaire sélectionnée lors de la création d'un entrainement
HeureDisponible plageHoraireSelectionne = new HeureDisponible();

class MyApp extends StatelessWidget {
  static const String _title = 'BdeBODY';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: _title, initialRoute: 'PremiereConnexion',
        //Les routes pour passer d'un menu à l'autre

        routes: {
          '/': (context) => Chargement(),
          '/PremiereConnexion': (context) => Connexion(),
          
          //'/premiereUtilisation' : (context) => PremiereUtilisation(),
          '/home': (context) => WidgetPrincipal(),
          '/menuEntrainements': (context) => MenuEntrainements(),
          '/MenuEntrainementsActuels': (context) => new MenuEntrainementsActuels(),
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
          '/MenuSelectionMuscles' :(context) => MenuSelectionMuscles(), 
          '/MenuChoixDispos': (context) => MenuChoixDispos(),

          
          
        });
  }
}

/// Widget principal de l'application

class WidgetPrincipal extends StatefulWidget {
  WidgetPrincipal({Key key}) : super(key: key);

  @override
  _WidgetPrincipalState createState() => _WidgetPrincipalState();
}



class _WidgetPrincipalState extends State<WidgetPrincipal> {
  int _selectedIndex = 1;
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

    StatefulWidget menuOuvert = MenuEntrainements();

//Sélection des menus
    switch (_selectedIndex) {
      
      case 0:
        menuOuvert = new GraphiquePoids();

        break;

      case 1:
        menuOuvert =  MenuEntrainements();
        

        break;

      case 2:
        menuOuvert = MenuProfil();

        break;
    }

    return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
        body: menuOuvert,

        
  //Barre de navigation entre les menus
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            
            BottomNavigationBarItem(
               icon: Icon(Icons.trending_up),
              title: Text('Entrainements'),
            ),
            BottomNavigationBarItem(
             icon: Icon(Icons.fitness_center),
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
      ),
    );
  }
}
