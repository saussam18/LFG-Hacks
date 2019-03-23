import 'package:city_finder/backgrounds.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new Start());
}

class Start extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _StartPageState();
}

class _StartPageState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
              children: <Widget>[
                SizedBox(height: 80.0),
                Column(
                  children: <Widget>[
                    Image.asset('assets/HomLogo.png'),
                    SizedBox(height: 6.0),
                  ]
                ),
                SizedBox(height: 120.0),
                TextField(
                  decoration: InputDecoration(
                    labelText:'Username',
                    filled: true,
                  ),
                ),
                SizedBox(height: 12.0),
                TextField(
                  decoration: InputDecoration(
                    labelText:'Password',
                    filled: true,
                  ),
                  obscureText: true,
                ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: Text('CANCEL'),
                      onPressed: (){

                      },
                    ),
                    RaisedButton(
                      child: Text('NEXT'),
                      onPressed: (){
                        
                      }
                    )
                  ],
                )
              ]
        )
      )
    );
  }
}
