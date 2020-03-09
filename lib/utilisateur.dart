

import 'entrainement.dart';

class Utilisateur {
  String nom = '';

  int age =0;

  double poids =0;

  double taille =0; 

  double imc =0;

  String courriel ='';

  String motDePasse ='';

  List<Entrainement> listeEntrainements = [new Entrainement("1"),new Entrainement("2"),new Entrainement("3"),new Entrainement("4"),new Entrainement("4")];
  
  
  Utilisateur(
      {String nom, int age, double poids, double taille, String courriel,String motDePasse}) {
    this.nom=nom;

    this.age = age;

    this.poids = poids;

    this.taille = taille;

    this.courriel=courriel;

    this.motDePasse=motDePasse;

    this.imc = (poids / (taille/100 * taille/100));
  }
  

}
