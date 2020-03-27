import 'package:bdebody/main.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'utilisateur.dart';

class Graphique2 extends StatefulWidget {
  //
  Graphique2() : super();
 
  final String title = "Graphique 2";
 
  @override
  Graphique2State createState() => Graphique2State();
}
 
class Graphique2State extends State<Graphique2> {
  //
  List<charts.Series> seriesList;
 
  static List<charts.Series<Sales, int>> _createRandomData() {
  
 
    final desktopSalesData = [
      Sales(utilisateur.listePoids[0],utilisateur.listeDate[0] ),
      Sales(utilisateur.listePoids[1],utilisateur.listeDate[1] ),
      Sales(utilisateur.listePoids[2],utilisateur.listeDate[2] ),
      Sales(utilisateur.listePoids[3],utilisateur.listeDate[3] ),
      Sales(utilisateur.listePoids[4],utilisateur.listeDate[4] ),
    ];
 

 

    return [
      charts.Series<Sales, int>(
        id: 'Sales',
        domainFn: (Sales sales, _) => sales.date,
        measureFn: (Sales sales, _) => sales.poids,
        data: desktopSalesData,
        fillColorFn: (Sales sales, _) {
          return charts.MaterialPalette.black;
        },
      ),
 
      
   
    ];
  }
 
  barChart() {
    return charts.BarChart(
      seriesList,
      animate: true,
      vertical: true,
      barGroupingType: charts.BarGroupingType.grouped,
      defaultRenderer: charts.BarRendererConfig(
        groupingType: charts.BarGroupingType.grouped,
        strokeWidthPx: 1.0,
      ),
      domainAxis: charts.OrdinalAxisSpec(
        renderSpec: charts.NoneRenderSpec(),
      ),
    );
  }

  lineChart(){
    return charts.LineChart(seriesList,
        animate: true,
        defaultRenderer: new charts.LineRendererConfig(includePoints: true),
        
        );
   }
 
  @override
  void initState() {
    super.initState();
    seriesList = _createRandomData();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: lineChart(),
      ),
    );
  }
}
 
class Sales {
  final double poids;
  final int date;
 
  Sales(this.poids, this.date);
}