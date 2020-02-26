

import 'entrainement.dart';

class Utilisateur {
  String prenom;

  String nomFamille;

  int age;

  double poids;

  List <double> listPoids = [59,60,62,59,61];

  double taille; 

  

  double imc;

  String courriel;

  List<Entrainement> listeEntrainements = [new Entrainement("1"),new Entrainement("2"),new Entrainement("3"),new Entrainement("4"),new Entrainement("5")];
  
  Utilisateur(
      String prenom, String nomFamille, int age, double poids, double taille) {
    this.prenom = prenom;

    this.nomFamille = nomFamille;

    this.age = age;

    this.poids = poids;
//this.listPoids.add(poids);
    this.taille = taille;

    this.imc = (poids / (taille/100 * taille/100));
  }

///Change le poids de l'utilisateur et ajoute la nouvelle valeur à la liste pour le suivi
  void nouveauPoids(double nvPoids){
    this.poids=nvPoids;
    this.listPoids.add(nvPoids);
  }
}
