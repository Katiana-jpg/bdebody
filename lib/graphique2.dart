import 'package:bdebody/main.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:currency_textfield/currency_textfield.dart';

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
    final List<Donnees> variationDuPoids = [];

    for (int i = 0; i < utilisateur.listeDate.length; i++) {
      variationDuPoids
          .add(Donnees(utilisateur.listePoids[i], utilisateur.listeDate[i]));
    }
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

  timeSeries() {
    return charts.TimeSeriesChart(
      seriesList,
      animate: true,
      primaryMeasureAxis: new charts.NumericAxisSpec(
          tickProviderSpec: new charts.BasicNumericTickProviderSpec(
              // Make sure we don't have values less than 1 as ticks
              // (ie: counts).
              dataIsInWholeNumbers: true,
              // Fixed tick count to highlight the integer only behavior
              // generating ticks [0, 1, 2, 3, 4].
              desiredTickCount: 5)),
      defaultRenderer: new charts.LineRendererConfig(includePoints: true),
      selectionModels: [
        charts.SelectionModelConfig(
            changedListener: (charts.SelectionModel model) {
          if (model.hasDatumSelection) _onSelectionChanged(model);
        })
      ],
      behaviors: [
        new charts.LinePointHighlighter(
            showVerticalFollowLine:
                charts.LinePointHighlighterFollowLineType.nearest),
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
    // CurrencyTextFieldController _controller = CurrencyTextFieldController();
    var _controller = CurrencyTextFieldController(
        rightSymbol: "Kg ", decimalSymbol: ".", thousandSymbol: ",");
    // double val = _controller.doubleValue;
    var now = new DateTime.now();

    // The children consist of a Chart and Text widgets below to hold the info.
    final children = <Widget>[
      new AppBar(
        backgroundColor: Colors.amber,
        title: Text('Statistiques'),
      ),
      Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ajouter un poids',
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: FlatButton(
                  onPressed: () {

                    if (_controller.doubleValue != null) {
                      utilisateur.listePoids.add(_controller.doubleValue);
                      utilisateur.listeDate.add(now);
                      _loadData();
                    }
                    setState(() {
                      
                    });
                  },
                  child: Text('Validé')))
        ],
      ),
      Center(
        child: new SizedBox(height: 200.0, child: timeSeries()),
      ),
    ];

    // If there is a selection, then include the details.
    if (_time != null) {
      children.add(new Padding(
          padding: new EdgeInsets.only(top: 5.0),
          child: new Text('Date: ' + _time.toString().substring(0, 10))));
    }
    _measures?.forEach((String series, num value) {
      children.add(new Text('Poids: ${value} Kg'));
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
