import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
 
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
 
  static List<charts.Series<Sales, String>> _createRandomData() {
    final random = Random();
 
    final desktopSalesData = [
      Sales('2015', random.nextInt(100)),
      Sales('2016', random.nextInt(100)),
      Sales('2017', random.nextInt(100)),
      Sales('2018', random.nextInt(100)),
      Sales('2019', random.nextInt(100)),
    ];
 

 

    return [
      charts.Series<Sales, String>(
        id: 'Sales',
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: desktopSalesData,
        fillColorFn: (Sales sales, _) {
          return charts.MaterialPalette.blue.shadeDefault;
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
        defaultRenderer: new charts.LineRendererConfig(includePoints: true)
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
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: barChart(),
      ),
    );
  }
}
 
class Sales {
  final String year;
  final int sales;
 
  Sales(this.year, this.sales);
}