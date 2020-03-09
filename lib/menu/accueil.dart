import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../utilisateur.dart';


class Accueil extends StatefulWidget {
  Accueil({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AccueilState();
}

class AccueilState extends State<Accueil> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCalendar(
    view: CalendarView.week,
  )
        ); 
  }
}