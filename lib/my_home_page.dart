import 'package:charts/graficas/linea.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'graficas/barras.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _tabPages = [
    Barras(),
    Linea(),
    Barras(),
    Barras(),
  ];
  final _tabItems = [
    Tab(
      text: "Barras",
      icon: Icon(FontAwesomeIcons.chartBar),
    ),
    Tab(
      text: "Linea",
      icon: Icon(FontAwesomeIcons.chartLine),
    ),
    Tab(
      text: "Pay",
      icon: Icon(FontAwesomeIcons.chartPie),
    ),
    Tab(
      text: "Scatter",
      icon: Icon(FontAwesomeIcons.braille),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabItems.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Graficas"),
          bottom: TabBar(tabs: _tabItems),
        ),
        body: TabBarView(children: _tabPages),
      ),
    );
  }
}
