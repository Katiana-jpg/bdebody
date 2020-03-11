

import 'entrainement.dart';

class Utilisateur {
  String nom ;

  String age ;

  String poids ;

  String taille ; 

  double imc ;

  String courriel ;

  String motDePasse ;

  List<Entrainement> listeEntrainements = [new Entrainement("1"),new Entrainement("2"),new Entrainement("3"),new Entrainement("4"),new Entrainement("4")];
  
  
  Utilisateur(
      {this.nom,  this.age, this.poids, this.taille, this.courriel,this.motDePasse}) {
    

    this.imc = (double.parse(poids) / (double.parse(taille)/100 * double.parse(taille)/100));
  }
  

}
