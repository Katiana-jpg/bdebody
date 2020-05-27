import 'dart:convert';
import 'package:bdebody/main.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:currency_textfield/currency_textfield.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:http/http.dart';

/**
 * Class de création de la page de suivi
 */
class GraphiquePoids extends StatefulWidget {
  
  GraphiquePoids() : super();

  final String title = "Graphique 2";

  @override
  GraphiquePoidsState createState() => GraphiquePoidsState();
}

class GraphiquePoidsState extends State<GraphiquePoids> {
  List<charts.Series> seriesList;

  //charge les données du graphique
  static List<charts.Series<Donnees, DateTime>> _loadData() {
    //Données du poids
    final List<Donnees> variationDuPoids = [];

    for (int i = 0; i < utilisateur.listeDate.length; i++) {
      variationDuPoids.add(Donnees(utilisateur.listePoids[i], utilisateur.listeDate[i]));
    }
 //Données de l'objectif

    final List<Donnees> objectif = [];

    if (utilisateur.objectifUtilisateur.siObjectifPoids == true) {
      Donnees debut = Donnees(utilisateur.objectifUtilisateur.objectifPoids,
          utilisateur.objectifUtilisateur.debutObjectif);
      Donnees fin = Donnees(utilisateur.objectifUtilisateur.objectifPoids,
          utilisateur.objectifUtilisateur.finObjectif);

      objectif.add(debut);
      objectif.add(fin);
    }

    return [
      new charts.Series<Donnees, DateTime>(
        id: 'Poids',
        domainFn: (Donnees sales, _) => sales.date,
        measureFn: (Donnees sales, _) => sales.poids,
        data: variationDuPoids,
        colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
        fillColorFn: (Donnees sales, _) {
          return charts.MaterialPalette.black;
        },
      ),
      new charts.Series<Donnees, DateTime>(
        id: 'Objectif',
        domainFn: (Donnees sales, _) => sales.date,
        measureFn: (Donnees sales, _) => sales.poids,
        data: objectif,
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
      ),
    ];
  }

/** 
 * Dessine un graphique de la forme d'une ligne chronologique
*/
  timeSeries() {
    
    return charts.TimeSeriesChart(
      seriesList,
      animate: true,
      primaryMeasureAxis: new charts.NumericAxisSpec(
          tickProviderSpec: new charts.BasicNumericTickProviderSpec(
          
              dataIsInWholeNumbers: true,
             
              desiredTickCount: 5)),
      defaultRenderer: new charts.LineRendererConfig(includePoints: true),
      selectionModels: [
        charts.SelectionModelConfig(
            changedListener: (charts.SelectionModel model) {
          if (model.hasDatumSelection) _onSelectionChanged(model);
        })
      ],
      behaviors: [
        new charts.SeriesLegend(),

  
      ],
    );
  }

/**
 * Dessine un cercle de progression de l'objectif
 */
  suiviObjectif() {
    Duration dureeTotal = utilisateur.objectifUtilisateur.finObjectif
        .difference(utilisateur.objectifUtilisateur.debutObjectif);
    Duration difference = utilisateur.objectifUtilisateur.debutObjectif
        .difference(DateTime.now());
    double _percent = (difference.inDays).abs() / (dureeTotal.inDays + 1);
    int jourRestants = (dureeTotal.inDays + 1 - difference.inDays).abs();
    if (_percent < 1) {
      return CircularPercentIndicator(
          radius: 150.0,
          animation: true,
          animationDuration: 1200,
          lineWidth: 15.0,
          percent: _percent,
          center: new Text("${jourRestants} Jours\n  restants",
              style:
                  new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)));
    } else {
      _percent = 1;
      return CircularPercentIndicator(
          radius: 150.0,
          animation: true,
          animationDuration: 1200,
          lineWidth: 15.0,
          percent: _percent,
          center: new Text("Temps écoulé",
              style:
                  new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)));
    }
  }

  DateTime _time;
  Map<String, num> _measures;

  //Récupère les données du point sélectionné et les attribuent a d'autres variables qui vont afficher ces informations dans un autre widget
  _onSelectionChanged(charts.SelectionModel model) {
    final selectedDatum = model.selectedDatum;

    DateTime date;
    final measures = <String, num>{};

    if (selectedDatum.isNotEmpty) {
      date = selectedDatum.first.datum.date;
      selectedDatum.forEach((charts.SeriesDatum datumPair) {
        measures[datumPair.series.displayName] = datumPair.datum.poids;
      });
    }

    setState(() {
      _time = date;
      _measures = measures;
    });
  }
/**
 * Construit les différents widgets 
 */
  @override
  Widget build(BuildContext context) {

    var _controller = CurrencyTextFieldController(
        rightSymbol: "Kg ", decimalSymbol: ".", thousandSymbol: ",");
    var now = new DateTime.now();
    final children = <Widget>[
      //dessine une AppBar
      new AppBar(
        backgroundColor: Colors.amber,
        title: Text('Suivi'),
        automaticallyImplyLeading: false,
      ),
      new SizedBox(height: 200.0, child: suiviObjectif()),
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
                      seriesList = _loadData();
                    }
                  },
                  child: Text('Validé')))
        ],
      ),
      Center(
        child: new SizedBox(height: 200.0, child: timeSeries()),
      ),
    ];

    if (_time != null) {
      children.add(new Padding(
          padding: new EdgeInsets.only(top: 5.0),
          child: new Text('Date: ' + _time.toString().substring(0, 10))));
    }
    _measures?.forEach((String series, num value) {
      children.add(new Text('Poids: ${value} Kg'));
    });

    return Scaffold(body: new ListView(children: children));
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

void getDonneesPoids() async {
  String url = "http://192.168.2.14:8080/get-user-data/";
  Response response = await post(url, body: {
    "courriel": utilisateur.courriel,
    "password": utilisateur.motDePasse,
  });
  utilisateur.listeDate.clear();
  utilisateur.listePoids.clear();
//Récupère une liste de ligne de donnée
  List<dynamic> userData = jsonDecode(response.body);

  userData.forEach((element) => {
        utilisateur.listePoids.add(element['poids'].toDouble()),
        utilisateur.listeDate.add(DateTime.parse(element['dateModification'])),
      });
}
