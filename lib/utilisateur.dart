import 'package:bdebody/nouvelObjectif.dart';
import 'entrainement.dart';
import 'exercice.dart';
import 'heureDisponible.dart';

///L'utilisateur entre ses informations personnelles
///Contenant le nom
///L'age [String]
///Le poids [String]
///La taille [String]
///Le couriel [String]
///Le mot de passe [String]
///Le genre [String]
///L'imc [String]
///L'objectif de l'utilisateur [NouvelObjectif]
///
///
///Cette classe contient aussi la [List<Exercice>] des exercices de base, 
///la [List<Entrainement>] des entrainements de l'utilisateur,
///et la [List<HeureDisponible>] des disponibilités de l'utilisateur

class Utilisateur {
  String nom;
  String age;
  String taille;
  String poids;
  String genre;
  String imc;

  String courriel;
  String motDePasse;

  List<double> listePoids = [];
  List<DateTime> listeDate = [];

  bool isConnected = false;

  List<Exercice> exercicesDeBase = new List<Exercice>();

  NouvelObjectif objectifUtilisateur;

  List<Entrainement> listeEntrainements = new List<Entrainement>();

  List<HeureDisponible> disponibiliteSemaine = [];

///Constructeur de la classe [Utilisateur]
  Utilisateur(
      {this.nom,
      this.age,
      this.taille,
      this.poids,
      this.genre,
      this.courriel,
      this.motDePasse}) {}

///Retourne un objet [Map<String, dynamic>] contenant les données de l'utilisateur
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
