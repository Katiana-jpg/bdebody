class Utilisateur {
  String prenom;

  String nomFamilleX;

  int age;

  double poids;

  double taille; 

  double imc;

  Utilisateur(
      String prenom, String nomFamille, int age, double poids, double taille) {
    this.prenom = prenom;

    this.nomFamilleX = nomFamille;

    this.age = age;

    this.poids = poids;

    this.taille = taille;

    this.imc = poids / (taille * taille);
  }
}

