import 'package:flutter/material.dart';

class Sexe extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() => SexeState();
}

class SexeState extends State<Sexe> {
  bool isPressed =false;
  bool isPressedFemme =false;
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
            IconButton(
            onPressed: (){
            setState((){
             (!isPressed) ? isPressed = true : isPressed = false;
            });
            },
              icon: Icon(Icons.tag_faces, 
              size:34,
              color: (isPressed) ? Colors.black
                        : Colors.white)),
            
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
           IconButton(
            onPressed: (){
            setState((){
             (!isPressedFemme) ? isPressedFemme = true : isPressedFemme = false;
            });
            },
              icon: Icon(Icons.tag_faces, 
              size:34,
              color: (isPressedFemme) ? Colors.black
                        : Colors.white)),
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