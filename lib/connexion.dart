import 'package:flutter/material.dart';

class Connexion extends StatefulWidget {
  //ConnexionState connexionState = new ConnexionState();
  //bool getValidate(){
  //   return connexionState.getValidate();
  // }
  Connexion({Key key}) : super(key: key);
 
  @override
  State<StatefulWidget> createState() => ConnexionState();
}

class ConnexionState extends State<Connexion> {
  // bool validate = false;
  // //Clé de validation
  final _formKey = GlobalKey<FormState>();
  
  // bool getValidate()
//   {
// return validate;

//   }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      
      //resizeToAvoidBottomInset : false,
        child: Center(
          
          
      child: SingleChildScrollView(child:
      AnimatedContainer(
        
      
      //margin: EdgeInsets.fromLTRB(20, 40, 20, 40),
      child:
      Column(children: <Widget>[
       SizedBox(height: 10),
        
        Container(
          
        child: Text('Connexion',
        style: TextStyle(
              color: Colors.lightBlueAccent[900],
              letterSpacing: 2,
              fontSize: 40,
              fontWeight: FontWeight.bold,
              
              
            ),
        ),  
       
        ),
         SizedBox(height: 50),
        
        
        Container(
          color: Colors.lightBlueAccent[50],
          //padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(horizontal : 5),
          
          child: TextFormField(
            validator: (value){
              if(value.isEmpty){
                return 'Entrez votre courriel';
              }
              return null;
            },
            decoration: InputDecoration(
              
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),

              ),
   
              hintText: 'Entrez votre courriel...'),

            onChanged: (String str) {
              //utilisateur.prenom = str;
            },
          ),
        ),
SizedBox(height: 10),
Container(
          color: Colors.lightBlueAccent[50],
          //padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(horizontal : 5),
          child: TextFormField(
            validator: (value){
              if(value.isEmpty){
                return 'Entrez votre mot de passe';
              }
              return null;
            },
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              
              hintText: 'Entrez votre mot de passe...'),
            onChanged: (String str) {
              //utilisateur.prenom = str;
            },
          ),
        ),

       SizedBox(height: 50),
       
       

       Container(
         margin: EdgeInsets.symmetric(horizontal : 50),
         child: RaisedButton(
                color: Colors.yellowAccent[700],
                elevation: 5,
                onPressed: () {
//Évenenement de connexion
// Validate returns true if the form is valid, otherwise false.
    
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
  //validate = true;
      Scaffold
            .of(context)
            .showSnackBar(SnackBar(content: Text('Connexion en cours...'), backgroundColor: Colors.yellowAccent[700],));
            
    }
  
         },
                child: Center(child: 
                  
                  Row(
                    children: <Widget>[
                      Expanded(flex:20,child: Text(' Se connecter', textAlign: TextAlign.center,)),
                      Expanded(flex:1, child: Icon(Icons.arrow_forward)),
                    ],
                  ),
                  ),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(25),
                    

              )),
       ),
       
       
       
       ]), duration: Duration(milliseconds: 500 ),

     


    )))
    
    );
  }
}
