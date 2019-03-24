import 'dart:ui';
import 'package:city_finder/home.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class Intro extends StatelessWidget {
  final pages = [
    PageViewModel(
        pageColor: Color.fromRGBO(36, 135, 195, 1.0),
        // iconImageAssetPath: 'assets/air-hostess.png',
        body: Text(
          'You create a profile',
        ),
        title: Text(
          'Graduates',
        ),
        textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
        mainImage: Image.asset(
          'assets/person.png',
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        )),
    PageViewModel(
      pageColor: Color.fromRGBO(255, 120, 0, 1.0),
      body: Text(
        'You match up with cities',
      ),
      title: Text('Cities'),
      mainImage: Image.asset(
        'assets/city.png',
        height: 205.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
  PageViewModel(
      pageColor: const Color(0xFF607D8B),
      body: Text(
        'Businesses find you for the job',
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



