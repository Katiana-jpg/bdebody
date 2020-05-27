
/// Disponibilités de l'utilisateur
class HeureDisponible {
//Jour de la disponibilité
  String jour;
 //Début de la disponibilité
  String debut;
 //fin de la disponibilité
  String fin;
 //retourne: true si la plage horaire est utilisé par un entrainement
  bool isUsed = false;
///Constructeur de disponibilité
  HeureDisponible( {this.jour,this.debut,this.fin, this.isUsed} );
///Retourne un objet [Map<String, dynamic>] avec les informations de la disponibilité
  Map<String, dynamic> toMap(){
    return {
      "jour" : this.jour,
      "debut" : this.debut,
      "fin" : this.fin,
      "isUsed" : this.isUsed.toString()
    };
    
  }
}