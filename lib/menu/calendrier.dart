import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import  'package:intl/date_symbol_data_local.dart';

class Calendrier extends StatefulWidget {
  Calendrier({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CalendrierState();
}

class CalendrierState extends State<Calendrier> {
  CalendarController _controller;
  @override 
  void initState(){
    super.initState();
    _controller = CalendarController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child:Container(
         padding : EdgeInsets.fromLTRB(10, 0,10, 0),   
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        TableCalendar(locale:'fr_FR',
        initialCalendarFormat: CalendarFormat.month,
        calendarController: _controller,
        calendarStyle: CalendarStyle(
          todayColor: Colors.orangeAccent,
          todayStyle: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 20


          )
        )
       ,
    headerStyle: HeaderStyle(
centerHeaderTitle: true,
formatButtonVisible: false,
    ),  )
      ],
     )) ));
   }
}
