import 'package:bdebody/entrainement.dart';
import 'package:bdebody/main.dart';
import 'package:flutter/material.dart';
import 'package:bdebody/connexion.dart'; 
import 'package:http/http.dart';
import '../../utilisateur.dart';



class MenuEntrainementsActuels extends StatefulWidget {
  @override
  _MenuEntrainementsActuelsState createState() =>
      _MenuEntrainementsActuelsState();
}

Entrainement entrainementActuel;

class _MenuEntrainementsActuelsState extends State<MenuEntrainementsActuels> {
  showAlertDialog(BuildContext context, Entrainement entrainement) {
    // set up the buttons
    Widget retourButton = FlatButton(
      child: Text("Retour"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget deleteButton = FlatButton(
      child: Text("Supprimer"),
      onPressed: () async {
        await post("http://192.168.2.14:8080/delete-entrainement/", body: {
          "courriel": utilisateur.courriel,
          "password": utilisateur.motDePasse,
          "nomEntrainement": entrainement.nomEntrainement
        });
        utilisateur.listeEntrainements.remove(entrainement);
        Scaffold.of(context).showSnackBar(SnackBar(content: Text("Entrainement supprimé",style:TextStyle(color : Colors.white)), backgroundColor: Colors.red,));
        setState(() {
        });
        Navigator.of(context).pop();
        
        
        
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Options"),
      content: Text("Voulez-vous supprimer l'entrainement ?"),
      actions: [
        retourButton,
        deleteButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    getEntrainements();
    List<Entrainement> entrainements = utilisateur.listeEntrainements;

     return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: false,
          //titleSpacing: 3.0,
          title: const Text(
            "Choisissez un entraînement",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.yellowAccent[700],
          elevation: 2.0,
        ),
        body: Builder(
                    builder: (context) => ListView(
            // children: new Utilisateur().listeEntrainements

            children: entrainements
                .map((item) => Container(
                  margin: EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          
                          Container(
                            height: 150,
                            child: new RaisedButton(
                              child: Row(children: <Widget>[
                                SizedBox(width: 20),
                                Icon(
                                  Icons.fitness_center,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                                                  child: Text(
                                    item.nomEntrainement,
                                    style: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: 2.0,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ]),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/ecranSeanceEntrainement');
                                entrainementActuel = item;
                              },
                              onLongPress: () {
                                showAlertDialog(context, item);
                              },
                              color: Colors.yellowAccent[700],
                              elevation: 15,
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(25),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          
                        ],
                      ),
                    ))
                .toList(),
          ),
        ),
      
    );
  }
}
