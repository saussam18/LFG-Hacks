import 'package:flutter/material.dart';

class ProfileCardAlignment extends StatelessWidget
{
  final int cardNum;
  ProfileCardAlignment(this.cardNum);

  @override
  Widget build(BuildContext context)
  {
    return new Card
    (
      child: new Stack
      (
        children: <Widget>
        [
          new SizedBox.expand
          (
            child: new Material
            (
              borderRadius: new BorderRadius.circular(12.0),
              child: new Image.asset('assets/Mpls.jpeg', fit: BoxFit.cover),
            ),
          ),
          new SizedBox.expand
          (
            child: new Container
            (
              decoration: new BoxDecoration
              (
                gradient: new LinearGradient
                (
                  colors: [ Colors.transparent, Colors.black54 ],
                  begin: Alignment.center,
                  end: Alignment.bottomCenter
                )
              ),
            ),
          ),
          new Align
          (
            alignment: Alignment.bottomLeft,
            child: new Container
            (
              padding: new EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: new Column
              (
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>
                [
                  new Text('Minneapolis', style: new TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w700)),
                  new Padding(padding: new EdgeInsets.only(bottom: 8.0)),
                  new Text('Located in mid-eastern Minnesota, Minneapolis is the largest city in the state, and is a part of the "Twin Cities" area, along with the states capital, St. Paul. As the urban center of "The Land of 10,000 Lakes," Minneapolis is known for its lakes and parks, along with its culture and art scenes.', textAlign: TextAlign.start, style: new TextStyle(color: Colors.white)),
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}