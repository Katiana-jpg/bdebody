import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:charts_flutter/flutter.dart' as charts;



class Chargement extends StatefulWidget {
  Chargement({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ChargementState();
}

class ChargementState extends State<Chargement> {



  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.amber,
        body: Center(
          
            child: Column(children: <Widget>[
      Expanded(
        flex: 1,
    
        
child:Center(
  child:   Text('BdeBody',
  
  style: TextStyle(
  
  fontSize: 20,
  
  fontWeight: FontWeight.bold,
  
  color: Colors.black,
  
  fontFamily: 'Pacifico'
  
  )
  
  ),
)
        
      ),
      Expanded(
        flex: 1,
 
          
      
   child: Image.asset(
                        "assets/Coureur.gif",
                        fit: BoxFit.contain,
                      )
        
      ),
      Expanded(
        flex: 1,
    child: SpinKitWave(color: Colors.black,


    )
        
      ),
    
    ]
    )
    )
    );

  }
}