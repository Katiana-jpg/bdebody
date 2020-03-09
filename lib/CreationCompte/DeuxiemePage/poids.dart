import 'package:flutter/material.dart';

class Poids extends StatefulWidget {
  @override
  _PoidsState createState() => _PoidsState();
}

class _PoidsState extends State<Poids> {
  double poids;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        Text(
          'Poids',
        ),
        LimitedBox(
            maxWidth: 150,
            child: Container(
                
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  onChanged: (String str){
                    poids = double.parse(str);
                  },
                ))),
        Text('KG'),
      ],
    );
  }
}
