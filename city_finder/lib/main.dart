import 'package:city_finder/Intro.dart';
import 'package:city_finder/home.dart';
import 'package:flutter/material.dart';

/* This is the main function that runs the app...basically do not touch  */
void main() {
  runApp(new MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'City Finder',
      home: new Intro(),
    );
  }
}