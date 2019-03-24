import 'dart:ui';
import 'package:city_finder/home.dart';
import 'package:city_finder/start.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class Intro extends StatelessWidget {
  final pages = [
    PageViewModel(
        pageColor: const Color(0xFF03A9F4),
        // iconImageAssetPath: 'assets/air-hostess.png',
        body: Text(
          'You create a profile',
        ),
        title: Text(
          'People',
        ),
        textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
        mainImage: Image.asset(
          'assets/person.png',
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        )),
    PageViewModel(
      pageColor: const Color(0xFF8BC34A),
      body: Text(
        'Cities help attract you',
      ),
      title: Text('Cities'),
      mainImage: Image.asset(
        'assets/city.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
  PageViewModel(
      pageColor: const Color(0xFF607D8B),
      body: Text(
        'Businesses find you žfor a job zzfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff',
      ),
      title: Text('Businesses'),
      mainImage: Image.asset(
        'assets/building.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
  ];
  @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'IntroViews Flutter', //title of app
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ), //ThemeData
        home: Builder(
          builder: (context) =>
              IntroViewsFlutter(
                pages,
                onTapDoneButton: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SwipeFeedPage(),
                    ), //MaterialPageRoute
                  );
                },
                pageButtonTextStyles: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ), //IntroViewsFlutter
        ), //Builder
      ); //Material App
    }
  }



