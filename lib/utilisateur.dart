import 'package:bdebody/nouvelObjectif.dart';

import 'entrainement.dart';
import 'exercice.dart';
import 'heureDisponible.dart';

class Utilisateur {
  String nom ;
  String age ;
  String taille ; 
  String poids  ;
  String genre;

  String imc ;

  String courriel ;
  String motDePasse ;
  
  double objectifPoids = 100;
  DateTime debutObjectif = DateTime.utc(2020, 01, 9);
  DateTime finObjectif = DateTime.utc(2021, 01, 9);



List<HeureDisponible> disponibiliteSemaine= [];

NouvelObjectif objectifUtilisateur;

  List<Entrainement> listeEntrainements = [
    new Entrainement(nomEntrainement : "Lundi", exercices :[
      new Exercice("Push-up", 0, 10, "description"),
      new Exercice("Jumping jacks", 30, 0, "description"),
      new Exercice("Dips", 0, 15, "description"),
      new Exercice("Squats", 0, 20, "description"),
      new Exercice("Planche", 30, 1, "description")
    ]),
    new Entrainement(nomEntrainement : "Mardi", exercices :[
      new Exercice("Dips", 30, 0, "description"),
      new Exercice("Dips", 0, 15, "description"),
      new Exercice("Squats", 0, 20, "description"),
      new Exercice("Planche", 30, 1, "description")]),
    
  ];
List<double> listePoids = [80.0, 83.0,75.0,79.0,82.0];
List<DateTime> listeDate = [DateTime.utc(2020, 01, 9),DateTime.utc(2020, 02, 10),DateTime.utc(2020, 03, 11),DateTime.utc(2020, 04, 12),DateTime.utc(2020, 05, 13)];
  Utilisateur(
      {this.nom,  this.age,this.taille, this.poids,  this.genre, this.courriel, this.motDePasse, this.imc }) {
  
  }

  
   Map<String, dynamic> toMap() {
    return {
      'nom': nom,
      'age': age,
      'taille' : taille,
      'poids' : poids,
      'genre' : genre,
      'imc': imc
    };
  }


}
