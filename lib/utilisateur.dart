import 'package:bdebody/nouvelObjectif.dart';

import 'entrainement.dart';
import 'exercice.dart';
import 'heureDisponible.dart';

class Utilisateur {
  String nom;
  String age;
  String taille;
  String poids;
  String genre;

  String imc;
List<double> listePoids = [80.0, 83.0,75.0,79.0,82.0];
List<DateTime> listeDate = [DateTime.utc(2020, 01, 9),DateTime.utc(2020, 02, 10),DateTime.utc(2020, 03, 11),DateTime.utc(2020, 04, 12),DateTime.utc(2020, 05, 13)];
  String courriel;
  String motDePasse;
  bool isConnected = false;

  List<Exercice> exercicesDeBase = new List<Exercice>();

  List<Entrainement> listeEntrainements = new List<Entrainement>();

List<HeureDisponible> disponibiliteSemaine = [];
NouvelObjectif objectifUtilisateur;

  Utilisateur(
      {this.nom,
      this.age,
      this.taille,
      this.poids,
      this.genre,
      this.courriel,
      this.motDePasse}) {}

  Map<String, dynamic> toMap() {
    return {
      'nom': nom,
      'age': age,
      'taille': taille,
      'poids': poids,
      'genre': genre,
      'imc': imc
    };
  }

  void calculerIMC() {
    double tailleAuCarre = int.parse(taille) * int.parse(taille) / 10000;

    this.imc = (double.parse(poids) / tailleAuCarre).toStringAsFixed(2);
  }
}
