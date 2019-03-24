import 'package:flutter/material.dart';
const String _name = "James";
const String _name2 = "Sam";

class ChatMessage extends StatelessWidget {
  final String text;
  final bool name;
// constructor to get text from textfield
  ChatMessage({
    this.text,
    this.name
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin:      const EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(
                backgroundColor: Colors.transparent,
                child: _getImage(),
              ),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(_getName(), style: Theme.of(context).textTheme.subhead),
                new Container(
                  width: MediaQuery.of(context).size.width - 72.0,
                  margin: const EdgeInsets.only(top: 5.0),
                  child: new Text(text),
                )
              ],
            )
          ],
        )
    );
  }
  _getImage(){
    if(name){
      return new Image.network("http://res.cloudinary.com/kennyy/image/upload/v1531317427/avatar_z1rc6f.png");
    }else{
      return new Image.asset('assets/HomLogo.png');
    }
  }
  _getName(){
    if(name){
      return _name;
    }else{
      return _name2;
    }
  }
}