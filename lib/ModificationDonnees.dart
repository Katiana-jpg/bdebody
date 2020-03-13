import 'package:flutter/material.dart';
import 'utilisateur.dart';

class ModificationDonnees extends StatefulWidget {
  @override
  _ModificationDonneesState createState() => _ModificationDonneesState();
}

class _ModificationDonneesState extends State<ModificationDonnees> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent[700],
        centerTitle: true,
        title: Text(
          "Modification des données",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: TextFormField(),
    );
  }
}