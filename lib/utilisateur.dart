import 'entrainement.dart';
import 'exercice.dart';

class Utilisateur {
  String nom ;
  String age ;
  String taille ; 
  String poids  ;
  String genre;

  String imc ;

  String courriel ;
  String motDePasse ;
  bool isConnected = false;

List<Exercice> exercicesDeBase = new List<Exercice>();

  List<Entrainement> listeEntrainements = new List<Entrainement>();


  Utilisateur(
      {this.nom,  this.age,this.taille, this.poids,  this.genre, this.courriel, this.motDePasse }) {
  
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

  void calculerIMC(){
double tailleAuCarre = int.parse(taille)*int.parse(taille)/10000;

this.imc = (double.parse(poids)/tailleAuCarre).toStringAsFixed(2);
  }
}
