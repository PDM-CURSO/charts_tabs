import 'package:charts/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Linea extends StatefulWidget {
  Linea({Key? key}) : super(key: key);

  @override
  _LineaState createState() => _LineaState();
}

class _LineaState extends State<Linea> {
  List<FlSpot>? _lineSpots0;

  @override
  void initState() {
    _lineSpots0 = [];
    for (int i = 0; i < datos.length; i++) {
      _lineSpots0?.add(
        FlSpot(
          i.toDouble(),
          datos[i]["cantidad"].toDouble(),
        ),
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _lineChartData = LineChartData(
        maxY: 10,
        gridData: FlGridData(show: true),
        axisTitleData: FlAxisTitleData(
          show: true,
          topTitle: AxisTitle(titleText: "Cantidadde productos"),
          leftTitle: AxisTitle(titleText: "Cantidad"),
          bottomTitle: AxisTitle(titleText: "Productos"),
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
              showTitles: true,
              getTitles: (index) => datos[index.toInt()]["producto"]),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: _lineSpots0,
            barWidth: 2,
            colors: [Colors.purple],
            isCurved: true,
            dotData: FlDotData(show: true),
          ),
        ]);
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Text("Grafica de linea"),
          ),
          SizedBox(height: 64),
          Expanded(
            flex: 2,
            child: LineChart(_lineChartData),
          ),
        ],
      ),
    );
  }
}
