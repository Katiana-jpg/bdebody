import 'package:bdebody/connexion.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'BdeBODY';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,

      home: new Connexion());
  }}