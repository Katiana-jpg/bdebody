import 'package:flutter/cupertino.dart';

class Exercice {
  String nom;

  double duree;

  int nbreRepetition; 

  String description;

Image image;
  Exercice(
      String nom,double duree, int nbreRepetition, String description, Image image) {
    this.nom = nom;

    this.duree = duree;

    this.nbreRepetition = nbreRepetition;

    this.description = description;

    this.image = image;

  }
}

