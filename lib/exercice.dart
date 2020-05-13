import 'package:bdebody/entrainement.dart';
import 'package:flutter/cupertino.dart';

class Exercice {
  String nom;
  int duree;
  int nbreRepetition; 
  String description;
  String intensite;

//Image image;
  Exercice(
      {String nom,int duree, int nbreRepetition, String description, String intensite}) {
    this.nom = nom;

    this.duree = duree;

    this.nbreRepetition = nbreRepetition;

    this.description = description;

    this.intensite = intensite;

  }

  // Map<String, dynamic> toMap(String entrainement){
  //   return {
  //     "nom" : this.nom,
  //     "duree" : this.duree,
  //     "repetitions" : this.nbreRepetition,
  //     "description" : this.description,
  //     "intensite" : this.intensite,
  //     "entrainement" : entrainement
  //   };
    
 // }
}

