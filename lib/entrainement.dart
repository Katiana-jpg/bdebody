import 'package:bdebody/exercice.dart';

class Entrainement {
  List<Exercice> exercices = new List<Exercice>();

  String nomEntrainement;

//Date

  Entrainement({String nomEntrainement, List<Exercice> exercices}) {
    this.nomEntrainement = nomEntrainement;
    this.exercices = exercices;
  }

//converti l'entrainement en objet JSON pour être envoyé au server
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['nom'] = this.nomEntrainement;

    List<String> nomsExercices;
    List<int> dureesExercices;
    List<int> repetitionsExercices;
    List<String> descriptionsExercices;
    this.exercices.forEach((exercice) {
      nomsExercices.add(exercice.nom);
      dureesExercices.add(exercice.duree);
      repetitionsExercices.add(exercice.nbreRepetition);
      descriptionsExercices.add(exercice.description);
    });

    data['exercices'] = [
      {
        "nom": nomsExercices,
        "duree": dureesExercices,
        "duree": repetitionsExercices,
        "duree": descriptionsExercices,
      }
    ];

    return data;
  }
}
