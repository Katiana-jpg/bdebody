import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'connexion.dart';


/**
 * Écran de chargement de l'application
 */
class Chargement extends StatefulWidget {
  Chargement({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ChargementState();
}
/**
   * Affiche l"écran de chargement tant que les données de la base de donnée ne sont pas chargées
   */
class ChargementState extends State<Chargement> {
    
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 5),// Il faut remplacer le 5 par le chargements des données de la base de donnée
      (){
        Navigator.push(context, 
        MaterialPageRoute(
          builder: (context) => Connexion(),
          ),);
      }
    );
  }

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