import 'entrainement.dart';
import 'exercice.dart';

class Utilisateur {
  String prenom;

  String nomFamille;

  int age;

  double poids;

  double taille;

  double imc;

  String courriel;

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
      String prenom, String nomFamille, int age, double poids, double taille) {
    this.prenom = prenom;

    this.nomFamille = nomFamille;

    this.age = age;

    this.poids = poids;

    this.taille = taille;

    this.imc = (poids / (taille / 100 * taille / 100));
  }
}
