///Class de création d'objectif
class NouvelObjectif{

 
//Description de l'objectif
  String objectif;
//Retourne : true si l'objectif est basé sur une augmentation, un maintient ou une diminution du poids
  bool siObjectifPoids = true;
//Defini la valeur du poids visé par l'utilisateur
  double objectifPoids ;
//Date à laquelle l'objectif est défini
DateTime debutObjectif ;
//Date à laquelle l'objectif prend fin
DateTime finObjectif;
 
///constructeur d'objectif
  NouvelObjectif({this.objectif,this.objectifPoids,this.siObjectifPoids, this.debutObjectif,this.finObjectif}){}

}