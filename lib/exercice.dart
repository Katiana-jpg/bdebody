
///Les instances de cette classes sont les exercices au sein d'un entrainement
class Exercice {
//Nom de l'exercice
  String nom;
  //Durée de l'exercice (s'il y en a)
  int duree;
  //Nombre de répétition de l'exercice (s'il y en a)
  int nbreRepetition;
 //Description de l'exercice (Chose qu'on aurait aimé rajouter pour chaque exercice)
  String description;
  //Intensité de l'exercice
  String intensite;

///Constructeur d'exercice
  Exercice(
      {String nom,int duree, int nbreRepetition, String description, String intensite}) {
    this.nom = nom;

    this.duree = duree;

    this.nbreRepetition = nbreRepetition;

    this.description = description;

    this.intensite = intensite;

  }

  ///Retourne un objet [Map<String, dynamic>] correspondant à l'entrainement
  Map<String, dynamic> toMap(String entrainement){
    return {
      "nom" : this.nom,
      "duree" : this.duree,
      "repetitions" : this.nbreRepetition,
      "description" : this.description,
      "intensite" : this.intensite,
      "entrainement" : entrainement
    };
    
 }
}

