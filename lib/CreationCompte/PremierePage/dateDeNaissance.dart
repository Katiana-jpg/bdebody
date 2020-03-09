import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
class DateDeNaissance extends StatefulWidget {
  @override
  _DateDeNaissanceState createState() => _DateDeNaissanceState();
}

class _DateDeNaissanceState extends State<DateDeNaissance> {
  DateTime dateNaissance;
  int dateNaissanceMois;
  int dateNaissanceAnnee;
  int dateNaissanceJour;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: <Widget>[
           FlatButton(
             padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
    onPressed: () {
        DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(1900, 1, 1),
                              maxTime: DateTime(2020, 3, 9), onChanged: (date) {
                            print('change $date');
                          }, onConfirm: (date) {
                            setState(() {
                               dateNaissanceMois=date.month;
                               dateNaissance=date;
                               dateNaissanceAnnee=date.year;
                               dateNaissanceJour=date.day;
                            print('confirm $date');
                            });
                           
                          }, currentTime: DateTime.now(), locale: LocaleType.fr);
    },
    child: Text(
      'Date de naissance',
      textAlign :TextAlign.left,
        
        style: TextStyle(color: Colors.blue),
    )),
    
    Container(
      
   child: Text(
(dateNaissance==null)? '':'$dateNaissanceAnnee/$dateNaissanceMois/$dateNaissanceJour',


    ),
    ), 
             ]  );} );
  }
}