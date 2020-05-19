import 'package:bdebody/exercice.dart';
import 'package:bdebody/heureDisponible.dart';


///Les objets de cette classe sont des entrainements de l'utilisateur
///[nomEntrainement : nom de l'entrainement, intensite : intensité de l'entraienement, date : moment de l'entrainement]
class Entrainement {
  List<Exercice> exercices = new List<Exercice>();
  HeureDisponible plageHoraire;
  String nomEntrainement;
  String intensite;

  //Il faudra le convertir en string pour mettre dans la DB
  DateTime date;
  
  
  Entrainement({String nomEntrainement, List<Exercice> exercices, String intensite, HeureDisponible plageHoraire}) {
    this.nomEntrainement = nomEntrainement;
    this.exercices = exercices;
    this.intensite=intensite;
    this.plageHoraire = plageHoraire;
  }

//converti l'entrainement en objet JSON pour être envoyé au server
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();

  //   data['nom'] = this.nomEntrainement;

  //   List<String> nomsExercices;
  //   List<int> dureesExercices;
  //   List<int> repetitionsExercices;
  //   List<String> descriptionsExercices;
  //   this.exercices.forEach((exercice) {
  //     nomsExercices.add(exercice.nom);
  //     dureesExercices.add(exercice.duree);
  //     repetitionsExercices.add(exercice.nbreRepetition);
  //     descriptionsExercices.add(exercice.description);
  //   });

  //   data['exercices'] = [
  //     {
  //       "nom": nomsExercices,
  //       "duree": dureesExercices,
  //       "duree": repetitionsExercices,
  //       "duree": descriptionsExercices,
  //     }
  //   ];

  //   return data;
  // }
}
