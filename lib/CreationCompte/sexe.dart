import 'package:flutter/material.dart';

class Sexe extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() => SexeState();
}

class SexeState extends State<Sexe> {
 
  int group =1;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          children: <Widget>[
            Container(
              width: 72.0,
              child: Text(
                "Sexe",
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Radio(value: 1,
           groupValue: group,
           onChanged: (T){
             setState(() {
               group = T;
             });
           },),
            
            SizedBox(
              width: 10.0,
            ),
            Container(
              width: 70.0,
              child: Text(
                "Homme",
                textAlign: TextAlign.left,
              ),
            ),
           Radio(value: 2,
           groupValue: group,
           onChanged: (T){
             setState(() {
               group = T;
             });
           },),
            SizedBox(
              width: 18.0,
            ),
            Container(
              width: 70.0,
              child: Text(
                "Femme",
                textAlign: TextAlign.left,
              ),
            ),
          ],
        );
        });
      }
  
  
}