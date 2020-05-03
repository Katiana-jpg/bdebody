import 'package:bdebody/exercice.dart';

class Entrainement {
  List<Exercice> exercices = new List<Exercice>();
  
  String nomEntrainement;
  String intensite;

  //Il faudra le convertir en string pour mettre dans la DB, de telle sorte qu,on puisse convertir le string back to a DateTime
  DateTime date;
  
  
  //Date
  Entrainement({String nomEntrainement, List<Exercice> exercices, String intensite}) {
    this.nomEntrainement = nomEntrainement;
    this.exercices = exercices;
    this.intensite=intensite;
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
