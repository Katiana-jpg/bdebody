import 'package:flutter/material.dart';

class HeureDisponible {
  String jour;
  String debut;
  String fin;

  bool isUsed = false;

  HeureDisponible( {this.jour,this.debut,this.fin} ){
    
  }

  Map<String, dynamic> toMap(){
    return {
      "jour" : this.jour,
      "debut" : this.debut,
      "fin" : this.fin,
      
    };
    
  }
}