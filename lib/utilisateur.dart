

import 'entrainement.dart';

class Utilisateur {
  String prenom;

  String nomFamille;

  int age;

  double poids;

  double taille; 

  double imc;

  String courriel;

  List<Entrainement> listeEntrainements = [new Entrainement("1"),new Entrainement("2"),new Entrainement("3"),new Entrainement("4")];
  
  Utilisateur(
      String prenom, String nomFamille, int age, double poids, double taille) {
    this.prenom = prenom;

    this.nomFamille = nomFamille;

    this.age = age;

    this.poids = poids;

    this.taille = taille;

    this.imc = (poids / (taille/100 * taille/100));
  }
}
