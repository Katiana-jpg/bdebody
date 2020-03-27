import 'package:bdebody/main.dart';
import 'package:flutter/material.dart';
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
 
  static List<charts.Series<Sales, DateTime>> _createRandomData() {
  
 
    final desktopSalesData = [
      Sales(utilisateur.listePoids[0],utilisateur.listeDate[0] ),
      Sales(utilisateur.listePoids[1],utilisateur.listeDate[1] ),
      Sales(utilisateur.listePoids[2],utilisateur.listeDate[2] ),
      Sales(utilisateur.listePoids[3],utilisateur.listeDate[3] ),
      Sales(utilisateur.listePoids[4],utilisateur.listeDate[4] ),
    ];
 

 

    return [
      charts.Series<Sales, DateTime>(
        id: 'Sales',
        domainFn: (Sales sales, _) => sales.date,
        measureFn: (Sales sales, _) => sales.poids,
        data: desktopSalesData,
         colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
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
    return charts.TimeSeriesChart(seriesList,
        animate: true,
        defaultRenderer: new charts.LineRendererConfig(includePoints: true),
         behaviors: [
      // Optional - Configures a [LinePointHighlighter] behavior with a
      // vertical follow line. A vertical follow line is included by
      // default, but is shown here as an example configuration.
      //
      // By default, the line has default dash pattern of [1,3]. This can be
      // set by providing a [dashPattern] or it can be turned off by passing in
      // an empty list. An empty list is necessary because passing in a null
      // value will be treated the same as not passing in a value at all.
      new charts.LinePointHighlighter(
          showHorizontalFollowLine:
              charts.LinePointHighlighterFollowLineType.nearest,
 
        showVerticalFollowLine:
              charts.LinePointHighlighterFollowLineType.nearest),
          
      // Optional - By default, select nearest is configured to trigger
      // with tap so that a user can have pan/zoom behavior and line point
      // highlighter. Changing the trigger to tap and drag allows the
      // highlighter to follow the dragging gesture but it is not
      // recommended to be used when pan/zoom behavior is enabled.
      new charts.SelectNearest(eventTrigger: charts.SelectionTrigger.tapAndDrag)
    ],
      selectionModels: [
              new charts.SelectionModelConfig(
                type: charts.SelectionModelType.info,
              //  listener: _onSelectionChanged,
              )
            ],
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
  final DateTime date;
 
  Sales(this.poids, this.date);
}
 