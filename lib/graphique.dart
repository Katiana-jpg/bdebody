import 'package:flutter_sparkline/flutter_sparkline.dart';



import 'package:flutter/material.dart';


class Graphique extends StatefulWidget {
  Graphique({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => GraphiqueState();
}

class GraphiqueState extends State<Graphique> {
 var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.amber,
        body: new Center(
          child: new Container(
            width: 300.0,
            height: 100.0,
            child: new Sparkline(
              data: data,
              fillMode: FillMode.below,
  fillColor: Colors.red[200],
  pointsMode: PointsMode.all,
  pointSize: 8.0,
  pointColor: Colors.blue,
            ),
          ),
        ),
          
     
        
    );
    
  

  }
}