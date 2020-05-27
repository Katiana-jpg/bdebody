import 'package:bdebody/entrainement.dart';
import 'package:bdebody/heureDisponible.dart';
import 'package:bdebody/main.dart';
import 'package:flutter/material.dart';


///Menu où l'utilisateur choisit la disponibilité qu'il va utiliser pour son nouvel entraînrment.
class MenuChoixDispos extends StatefulWidget {
  @override
  _MenuChoixDisposState createState() =>
      _MenuChoixDisposState();
}

///Entrainement actuel de l'utilisateur
Entrainement entrainementActuel;


///Définit l'état d'une instance de [MenuChoixDispos]
class _MenuChoixDisposState extends State<MenuChoixDispos> {
 ///Toutes les disponibilitées de l'utilisateur
  List<HeureDisponible> disponibilites = utilisateur.disponibiliteSemaine;
     @override
void initState(){
super.initState();
disponibilites = utilisateur.disponibiliteSemaine;
}
  
  @override
  Widget build(BuildContext context) {
    disponibilites = utilisateur.disponibiliteSemaine;
    // showAlertDialog(BuildContext context, Entrainement entrainement) {
    //   // set up the buttons
    //   Widget retourButton = FlatButton(
    //     child: Text("Retour"),
    //     onPressed: () {
    //       Navigator.of(context).pop();
    //     },
    //   );
    //   Widget deleteButton = FlatButton(
    //     child: Text("Supprimer"),
    //     onPressed: () async {
    //       await post("http://192.168.2.14:8080/delete-entrainement/", body: {
    //         "courriel": utilisateur.courriel,
    //         "password": utilisateur.motDePasse,
    //         "nomEntrainement": entrainement.nomEntrainement
    //       });
    //       utilisateur.listeEntrainements.remove(entrainement);
    //       Scaffold.of(context).showSnackBar(SnackBar(
    //         content: Text("Entrainement supprimé",
    //             style: TextStyle(color: Colors.white)),
    //         backgroundColor: Colors.grey,
    //       ));

    //       Navigator.of(context).pop();
    //       setState(() {
    //         disponibilites = utilisateur.disponibiliteSemaine;
    //       });
          
    //     },
    //   );

    //   // set up the AlertDialog
    //   AlertDialog alert = AlertDialog(
    //     title: Text("Options"),
    //     content: Text("Voulez-vous supprimer l'entrainement ?"),
    //     actions: [
    //       retourButton,
    //       deleteButton,
    //     ],
    //   );

    //   // show the dialog
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return alert;
    //     },
    //   );
    // }

 

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: false,
        //titleSpacing: 3.0,
        title: const Text(
          "Choisissez une disponibilité",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellowAccent[700],
        elevation: 2.0,
      ),
      body: Builder(
        builder: (context) => ListView(
          // children: new Utilisateur().listeEntrainements

          children: disponibilites
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
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      item.jour,
                                      style: TextStyle(
                                        color: Colors.black,
                                        letterSpacing: 2.0,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'De ' +item.debut.substring(10,14) + ' à ' + item.fin.substring(10,14),
                                      style: TextStyle(
                                        color: Colors.black,
                                        letterSpacing: 2.0,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                            onPressed: () {
                              if(!item.isUsed){
                              plageHoraireSelectionne=item;
                              Navigator.pushNamed(context, '/MenuSelectionMuscles');
                              }else{
                                Scaffold.of(context).showSnackBar(SnackBar(content: Text('Plage horaire déjà utilisée'),));
                              }
                            },
                            onLongPress: () {
                              //showAlertDialog(context, item);
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
