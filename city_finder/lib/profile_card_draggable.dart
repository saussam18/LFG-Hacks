import 'package:flutter/material.dart';

class ProfileCardDraggable extends StatelessWidget
{
  final int cardNum;
  ProfileCardDraggable(this.cardNum);

  @override
  Widget build(BuildContext context)
  {
    return new Card
    (
      child: new Column
      (
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>
        [
          new Expanded
          (
            child: new Image.asset('assets/Mpls.png', fit: BoxFit.cover),
          ),
          new Container
          (
            padding: new EdgeInsets.symmetric(vertical: 50.0, horizontal: 25.0),
            child: new Column
            (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>
              [
                new Text('Minneapolis', style: new TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700)),
                new Padding(padding: new EdgeInsets.only(bottom: 8.0)),
                new Text('Located in mid-eastern Minnesota, Minneapolis is the largest city in the state, and is a part of the "Twin Cities" area, along with the states capital, St. Paul. As the urban center of "The Land of 10,000 Lakes," Minneapolis is known for its lakes and parks, along with its culture and art scenes.', textAlign: TextAlign.start, style: new TextStyle(color: Colors.white)),
              ],
            )
          )
        ],
      ),
    );
  }
}