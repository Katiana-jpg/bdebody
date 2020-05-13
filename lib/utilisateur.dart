import 'package:bdebody/menu/graphiquePoids.dart';
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

//! utiliser l'objetNouvelObjectif
double objectifPoids = 100;
  DateTime debutObjectif = DateTime.utc(2020, 01, 9);
  DateTime finObjectif = DateTime.utc(2021, 01, 9);


List<double> listePoids = [];
List<DateTime> listeDate = [];
  String courriel;
  String motDePasse;
  bool isConnected = false;

  List<Exercice> exercicesDeBase = new List<Exercice>();

  List<Entrainement> listeEntrainements = new List<Entrainement>();

List<HeureDisponible> disponibiliteSemaine = [];
NouvelObjectif objectifUtilisateur ;

  Utilisateur(
      {this.nom,
      this.age,
      this.taille,
      this.poids,
      this.genre,
      this.courriel,
      this.motDePasse}) {
        
      }

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
