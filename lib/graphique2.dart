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
 
  static List<charts.Series<Donnees, DateTime>> _loadData() {
  
 
    final variationDuPoids= [
     Donnees(utilisateur.listePoids[0],utilisateur.listeDate[0] ),
     Donnees(utilisateur.listePoids[1],utilisateur.listeDate[1] ),
     Donnees(utilisateur.listePoids[2],utilisateur.listeDate[2] ),
     Donnees(utilisateur.listePoids[3],utilisateur.listeDate[3] ),
     Donnees(utilisateur.listePoids[4],utilisateur.listeDate[4] ),
    ];

    return [
      charts.Series<Donnees, DateTime>(
        id: 'Sales',
        domainFn: (Donnees sales, _) => sales.date,
        measureFn: (Donnees sales, _) => sales.poids,
        data: variationDuPoids,
         colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
        fillColorFn: (Donnees sales, _) {
          return charts.MaterialPalette.black;
        },
      ),
    ];
  }
 
  
  timeSeries(){
    return charts.TimeSeriesChart(seriesList,
        animate: false,
        defaultRenderer: new charts.LineRendererConfig(includePoints: true),
         selectionModels: [
        charts.SelectionModelConfig(
          changedListener: (charts.SelectionModel model) {
            if(model.hasDatumSelection)
              _onSelectionChanged(model);
         
          }
        )
      ],
         behaviors: [

      new charts.LinePointHighlighter(
          showHorizontalFollowLine:
              charts.LinePointHighlighterFollowLineType.nearest,
 
        showVerticalFollowLine:
              charts.LinePointHighlighterFollowLineType.nearest),
          

      new charts.SelectNearest(eventTrigger: charts.SelectionTrigger.tapAndDrag)
    ], 
        );
   }

  DateTime _time;
  Map<String, num> _measures;

  // Listens to the underlying selection changes, and updates the information
  // relevant to building the primitive legend like information under the
  // chart.
  _onSelectionChanged(charts.SelectionModel model) {
    final selectedDatum = model.selectedDatum;

    DateTime date;
    final measures = <String, num>{};

    // We get the model that updated with a list of [SeriesDatum] which is
    // simply a pair of series & datum.
    //
    // Walk the selection updating the measures map, storing off the sales and
    // series name for each selection point.
    if (selectedDatum.isNotEmpty) {
      date = selectedDatum.first.datum.date;
      selectedDatum.forEach((charts.SeriesDatum datumPair) {
        measures[datumPair.series.displayName] = datumPair.datum.poids;
      });
    }

    // Request a build.
    setState(() {
      _time = date;
      _measures = measures;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    // The children consist of a Chart and Text widgets below to hold the info.
    final children = <Widget>[
      new AppBar(backgroundColor: Colors.amber,title: Text('Statistiques'),),
    new  TextField(
  obscureText: false,
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Ajouter un poids',
  ),
),
      new SizedBox(
          height: 200.0,
     child:timeSeries()),
    ];

    // If there is a selection, then include the details.
    if (_time != null) {
      children.add(new Padding(
          padding: new EdgeInsets.only(top: 5.0),
          child: new Text(_time.toString())));
    }
    _measures?.forEach((String series, num value) {
      children.add(new Text('${series}: ${value}'));
    });

    return new Column(children: children);
  }


  @override
  void initState() {
    super.initState();
    seriesList = _loadData();
  }
 
 }
class Donnees {
  final double poids;
  final DateTime date;
 
  Donnees(this.poids, this.date);
}
 