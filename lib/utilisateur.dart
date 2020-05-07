import 'entrainement.dart';
import 'exercice.dart';
/**
 *L'utilisateur entre ses informations personnelles
 *Contenant le nom
 *L'age
 *Le poids
 *La taille
 *Le couriel
 *Le mot de passe
 *Le genre
 *Cette classe contient aussi la Liste des exercices a faire
 */
class Utilisateur {
  String nom ;

  String age ;

  String poids  ;

  String taille ; 

  String imc ;

  String courriel ;

  String motDePasse ;

  String genre;



  List<Entrainement> listeEntrainements = [
    new Entrainement("Lundi", [
      new Exercice("Push-up", 0, 10, "description"),
      new Exercice("Jumping jacks", 30, 0, "description"),
      new Exercice("Dips", 0, 15, "description"),
      new Exercice("Squats", 0, 20, "description"),
      new Exercice("Planche", 30, 1, "description")
    ]),
    new Entrainement("Mardi", [
      new Exercice("Dips", 30, 0, "description"),
      new Exercice("Dips", 0, 15, "description"),
      new Exercice("Squats", 0, 20, "description"),
      new Exercice("Planche", 30, 1, "description")]),
    new Entrainement("Jeudi", [
      new Exercice("Squats", 30, 0, "description"),
      new Exercice("Dips", 0, 15, "description"),
      new Exercice("Squats", 0, 20, "description"),
      new Exercice("Planche", 30, 1, "description")]),
    new Entrainement("Vendredi", [new Exercice("Push-uppppp", 0, 10, "description"),
      new Exercice("Jumping jacks", 30, 0, "description"),
      new Exercice("Dips", 0, 15, "description"),
      new Exercice("Squats", 0, 20, "description"),
      new Exercice("Planche", 30, 1, "description")]),
    new Entrainement("Dimanche", [new Exercice("Push-down", 0, 10, "description"),
      new Exercice("Jumping jacks", 30, 0, "description"),
      new Exercice("Dips", 0, 15, "description"),
      new Exercice("Squats", 0, 20, "description"),
      new Exercice("Planche", 30, 1, "description")])
  ];


  Utilisateur(
      {this.nom,  this.age, this.poids, this.taille, this.courriel,this.motDePasse,this.imc,this.genre}) {
    




  }
  

}
