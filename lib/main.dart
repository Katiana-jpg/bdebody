import 'package:flutter/material.dart';

import 'utilisateur.dart';

void main() => runApp(MyApp());
Utilisateur utilisateur = new Utilisateur('Karl Elie ', 'Hien', 17, 58, 1.81);
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
class PremiereUtilisation extends StatefulWidget {
  PremiereUtilisation({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PremiereUtilisationState();
}

class PremiereUtilisationState extends State<Accueil> {
//   TextField txtPrenom = new TextField(
//     decoration: InputDecoration(hintText: 'Entrez votre nom...'),
//     onSubmitted: (String txt){
// utilisateur.prenom = txt;    },);

//   TextField txtAge = new TextField(decoration: InputDecoration(hintText: 'Entrez votre âge...'), onSubmitted: (String txt){
// utilisateur.age = int.parse(txt);    },);

//   TextField txtPoids = new TextField(
  
//     decoration: InputDecoration(hintText: 'Entrez votre poids...'), onSubmitted: (String txt){
// utilisateur.poids = double.parse(txt);    },);
  
  @override
  Widget build(BuildContext context) {
    Scaffold(

      body: Column(
children: <Widget>[

// Container(
// padding: EdgeInsets.all(10),
// child : txtPrenom,
// ),
// Container(
// padding: EdgeInsets.all(10),
// child : txtAge,
// ),
// Container(
// padding: EdgeInsets.all(10),
// child : txtPoids,
// ),
Container(
  padding: EdgeInsets.all(10),
child : FlatButton(
  child: Text('Soumettre'), 
  onPressed: () {
//utilisateur.prenom = txtPrenom.onSubmitted(),

  },),
),



]

      ),

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
            color: Colors.lightBlueAccent[200],
            padding: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(hintText: 'Entrez votre nom...'),
              onChanged: (String str){
                utilisateur.prenom=str;
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.lightBlueAccent[400],
            padding: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(hintText: 'Entrez votre âge...'),
              onChanged: (String str){
                utilisateur.age=int.parse(str);
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.lightBlue[600],
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(hintText: 'Entrez votre poids...') ,
              onChanged: (String str){
                utilisateur.poids=double.parse(str);
              },
            ),
          ),
        ),
      
      
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
            Row(
              children : <Widget>[
              Text(
              'NOM',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
              
            )]),
            SizedBox(height : 10),
            Text(
              utilisateur.prenom,
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
              utilisateur.age.toString(),
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
              utilisateur.poids.toString() + ' kg',
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
  }
}
