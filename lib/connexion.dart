import 'package:flutter/material.dart';

class Connexion extends StatefulWidget {
 

  Connexion({Key key}) : super(key: key);
 
  @override
  State<StatefulWidget> createState() => ConnexionState();
}

class ConnexionState extends State<Connexion> {
  
  //Clé de validation
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      //resizeToAvoidBottomInset : false,
        child: Center(
          
          
      child: SingleChildScrollView(child:
      Container(
        
      
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
         SizedBox(height: 10),
        
        
        Container(
          color: Colors.lightBlueAccent[50],
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(5),
          
          child: TextFormField(
            validator: (value){
              if(value.isEmpty){
                return 'Entrez votre courriel';
              }
              return null;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
   
              hintText: 'Entrez votre courriel...'),

            onChanged: (String str) {
              //utilisateur.prenom = str;
            },
          ),
        ),
SizedBox(height: 10),
Container(
          color: Colors.lightBlueAccent[50],
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(5),
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

       SizedBox(height: 10),
       
       
       FlatButton(
         
      child: Text('Se connecter'), 
       
       onPressed: () {
//Évenenement de connexion
// Validate returns true if the form is valid, otherwise false.
    
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
  
      Scaffold
          .of(context)
          .showSnackBar(SnackBar(content: Text('Connexion en cours...')));
          
    }
  
       },)]),

     


    )))
    
    );
  }
}
