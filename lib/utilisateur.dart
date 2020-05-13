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


  String courriel ;
  String motDePasse ;  



List<double> listePoids = [];
List<DateTime> listeDate = [];

  bool isConnected = false;

  List<Exercice> exercicesDeBase = new List<Exercice>();


NouvelObjectif objectifUtilisateur;

  List<Entrainement> listeEntrainements = new List<Entrainement>();


List<HeureDisponible> disponibiliteSemaine = [];


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
