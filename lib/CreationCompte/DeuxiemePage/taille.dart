import 'package:flutter/material.dart';

class Taille extends StatefulWidget {
  @override
  _TailleState createState() => _TailleState();
}

class _TailleState extends State<Taille> {
  double taille;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        Text(
          'Taille',
        ),
        LimitedBox(
            maxWidth: 150,
            child: Container(
                
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  onChanged: (String str){
                    taille = double.parse(str);
                  },
                ))),
        Text('cm'),
      ],
    );
  }
}