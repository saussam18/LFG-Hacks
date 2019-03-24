


import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  var tags = ['Young', 'Hot', 'Cold'];
  Map<String, bool> tagsmap = {
    'Young':false,
    'Cold':false,
    'Hot':false

  };
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CheckboxListTile makeListTile(String lesson) => CheckboxListTile(
      value: tagsmap[lesson],
      onChanged: (bool value) {
        setState(() {
          tagsmap[lesson] =value;
        });
      },
      secondary: const Icon(Icons.hourglass_empty),
      title: Text(
        lesson,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
    Card makeCard(String lesson) =>
        Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: makeListTile(lesson),
          ),
        );
    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(tags[index]);
        },
      ),
    );
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(

      ),
      body: makeBody,

    );





  }
}