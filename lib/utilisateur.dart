import 'package:bdebody/nouvelObjectif.dart';

import 'entrainement.dart';
import 'exercice.dart';

import 'heureDisponible.dart';


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
///Calcul l'indice de masse corporel de l'utilisateur
  void calculerIMC() {
    double tailleAuCarre = int.parse(taille) * int.parse(taille) / 10000;

    this.imc = (double.parse(poids) / tailleAuCarre).toStringAsFixed(2);
  }
}
