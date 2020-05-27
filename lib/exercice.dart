import 'package:bdebody/entrainement.dart';
import 'package:flutter/cupertino.dart';


///Les instances de cette classes sont les exercices au sein d'un entrainement
class Exercice {
  String nom;
  int duree;
  int nbreRepetition; 
  String description;
  String intensite;


  Exercice(
      {String nom,int duree, int nbreRepetition, String description, String intensite}) {
    this.nom = nom;

    this.duree = duree;

    this.nbreRepetition = nbreRepetition;

    this.description = description;

    this.intensite = intensite;

  }

  ///Retourne un objet [Map<String, dynamic>] correspondant à l'entrainement
  Map<String, dynamic> toMap(String entrainement){
    return {
      "nom" : this.nom,
      "duree" : this.duree,
      "repetitions" : this.nbreRepetition,
      "description" : this.description,
      "intensite" : this.intensite,
      "entrainement" : entrainement
    };
    
 }
}

