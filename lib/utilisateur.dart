class Utilisateur {
  String prenom;

  String nomFamille;

  int age;

  double poids;

  double taille; 

  double imc;

  String courriel;
  Utilisateur(
      String prenom, String nomFamille, int age, double poids, double taille) {
    this.prenom = prenom;

    this.nomFamille = nomFamille;

    this.age = age;

    this.poids = poids;

    this.taille = taille;

    this.imc = (poids / (taille/100 * taille/100));
  }
}

