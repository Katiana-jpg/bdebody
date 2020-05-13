class NouvelObjectif{

  String date;

  String objectif;

  bool siObjectifPoids = true;

  double objectifPoids = 100;

  DateTime debutObjectif = DateTime.now();

  DateTime finObjectif = DateTime.utc(2021, 01, 9);

  NouvelObjectif({this.objectif,this.date,this.objectifPoids,this.siObjectifPoids, this.debutObjectif,this.finObjectif}){}

}