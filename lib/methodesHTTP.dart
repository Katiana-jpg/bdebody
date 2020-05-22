import 'dart:convert';

import 'package:bdebody/heureDisponible.dart';
import 'package:bdebody/nouvelObjectif.dart';
import 'package:http/http.dart';

import 'entrainement.dart';
import 'exercice.dart';
import 'main.dart';

/// Communique avec le server pour enregistrer les disponibiliéts de l'utilisateur dans la base de données
void addDispos() async {
  String urlAddDispos = "http://" + host + ":8080/add-dispos";

  List<Map<String, dynamic>> listeDispos = List<Map<String, dynamic>>();

//pour chaque heureDisponible, ajoute un objet Map<String, dynamic> à la liste_dispos à envoyer dans le server
  utilisateur.disponibiliteSemaine
      .forEach((heureDisponible) => {listeDispos.add(heureDisponible.toMap())});

  print(listeDispos);

  //Transforme les dispos en string json
  List<String> listeDisposString = new List<String>();
  listeDispos.forEach((heureDisponible) =>
      {listeDisposString.add(jsonEncode(heureDisponible))});

  //Ecrit la variable "json" dans un format qui poura être parse dans NodeJS
  String json = "[";
  for (int i = 0; i < listeDisposString.length; i++) {
    if (i != (listeDisposString.length - 1)) {
      json += listeDisposString[i] + ",";
    } else {
      json += listeDisposString[i];
    }
  }
  json += "]";

  dynamic body = {
    "courriel": utilisateur.courriel,
    "password": utilisateur.motDePasse,
    "liste_dispos": json
  };

  await post(urlAddDispos, body: body);
}

///Récupère les disponibilités de l'utilisateur dans la base de données
void getDispos() async {
  ///URL pour la requête de disponibilités
  String urlGetDispos = "http://" + host + ":8080/get-dispos";

  ///Body de la requête
  dynamic body = {
    "courriel": utilisateur.courriel,
    "password": utilisateur.motDePasse,
  };

  Response response = await post(urlGetDispos, body: body);

//Récupère une liste de ligne de donnée
  List<dynamic> userDispos = jsonDecode(response.body);
  utilisateur.disponibiliteSemaine.clear();
  //ajoute les disponibilités de la db à l'utilisateur
  userDispos.forEach((dispo) {
    utilisateur.disponibiliteSemaine.add(new HeureDisponible(
        jour: dispo['jour'],
        debut: dispo['debut'],
        fin: dispo['fin'],
        isUsed: (dispo['isUsed'].toLowerCase() == 'true')));
  });
}

///Recupére les données personnelles de l'utilisateur depuis la base de données
void getUserData() async {
  ///URL pour la requête de données de l'utilisateur
  String url = "http://" + host + ":8080/get-user-data/";
  
  ///Réponse du server
  Response response = await post(url, body: {
    "courriel": utilisateur.courriel,
    "password": utilisateur.motDePasse,
  });

  //Pour débogage
  print(response.body);

  ///Récupère une liste de lignes de données utilisateur
  List<dynamic> userData = jsonDecode(response.body);

  ///Recupère le dernier élément de cette liste (le plus récent)
  ///pour assigner les valeurs qu'il contient aux paramètres de l'utilisateur
  Map<String, dynamic> map = userData.elementAt(userData.length - 1);
  print(map['nom']);
  utilisateur.nom = map['nom'];
  utilisateur.age = map['age'].toString();
  utilisateur.poids = map['poids'].toString();
  utilisateur.taille = map['taille'].toString();
  utilisateur.listePoids.add(map['poids'].toDouble());
  utilisateur.listeDate.add(DateTime.parse(map['dateModification']));
  utilisateur.genre = map['genre'].toString();
  utilisateur.calculerIMC();
}

///Récupère les exercices des entrainements de l'utilisateur depuis la base de données
void getUserExercices() async {
  ///URL pour la requête de récupération d'exercices de l'utilsateur
  String url1 = "http://" + host + ":8080/get-user-exercices/";
  

  await getEntrainements();
  
  ///Réponse de la requête
  Response responseExercices = await post(url1, body: {
    "courriel": utilisateur.courriel,
    "password": utilisateur.motDePasse,
  });

  ///Récupère une liste de lignes de données d'exercices
  List<dynamic> userExercices = jsonDecode(responseExercices.body);

  //Ajoute les exercices de la base de données aux entrainements de l'utilisateur
  utilisateur.listeEntrainements.forEach((entrainement) {
    userExercices.forEach((exercice) {
      if (exercice['entrainement'] == entrainement.nomEntrainement) {
        entrainement.exercices.add(new Exercice(
            nom: exercice['nom'],
            nbreRepetition: exercice['repetitions'],
            duree: exercice['duree'],
            description: exercice['description'],
            intensite: "intensite"));
      }
    });
  });
}

///Récupère les entrainements de l'utilisateur depuis la base de données
Future getEntrainements() async {
  ///URL pour la requête des entraînements de l'utilisateur
  String url1 = "http://" + host + ":8080/get-entrainements/";

///Réponse de la requête
  Response responseEntrainements = await post(url1, body: {
    "courriel": utilisateur.courriel,
    "password": utilisateur.motDePasse,
  });

  ///Récupère une liste de ligne de donnée
  List<dynamic> userEntrainements = jsonDecode(responseEntrainements.body);
  
  //Reset le contenu de la liste des entraînements
  utilisateur.listeEntrainements.clear();
  
  //Ajoute les entrainement de la db à l'utilisateur
  userEntrainements.forEach((entrainement) {
    utilisateur.listeEntrainements.add(new Entrainement(
        nomEntrainement: entrainement['nom'],
        intensite: entrainement['intensite'],
        plageHoraire: new HeureDisponible(
          jour: entrainement['dispoJour'],
          debut: entrainement['dispoDebut'],
          fin: entrainement['dispoFin'],
        ),
        exercices: new List<Exercice>()));
  });
}

///Récupère l'objectif SMART de l'utilisateur depuis la base de données
void getObjectif() async {
  ///URL pour la requête de récupération de l'objectif
  String url = "http://" + host + ":8080/get-user-objectif/";
  
  ///Réponse de la requête
  Response responseObjectif = await post(url, body: {
    "courriel": utilisateur.courriel,
    "password": utilisateur.motDePasse,
  });

///Objectif de la réponse converti en objet de type Map 
  Map<String, dynamic> objectif = jsonDecode(responseObjectif.body);
  print(objectif);

//Défini les valeurs de l'objectif de l'utilisateur en fonction de ce qui a été récupéré dans la base de données
  utilisateur.objectifUtilisateur = new NouvelObjectif();
  utilisateur.objectifUtilisateur.objectif = objectif['objectif'];
  utilisateur.objectifUtilisateur.debutObjectif =
      DateTime.parse(objectif['debutObjectif']);
  utilisateur.objectifUtilisateur.finObjectif =
      DateTime.parse(objectif['finObjectif']);
  utilisateur.objectifUtilisateur.objectifPoids =
      objectif['poidsCible'].toDouble();
  utilisateur.objectifUtilisateur.siObjectifPoids =
      (objectif['siObjectifPoids'].toLowerCase() == 'true');
}
