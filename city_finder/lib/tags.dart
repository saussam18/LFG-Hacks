


import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  var tags = ['Trendy', 'Young', 'Aging', 'Retired', 'Golf',
  'Winter','Summer Single season','Changing seasons','East coast','Westcoast','Midwest',
  'Mountain west','Late night','Early rise','Republican','Democrat','Unaffiliated','History',
  'Apartment','House','Small city','Medium city','Large city','Public transport',
  'Car','Cycling','Prevalent parks','Outdoor recreation','Near mountains','In mountains',
  'Near lakes','Near ocean','On coast','Near beach','Near river','Environmentally friendly',
  'Prevalent music','Prevalent art','Prevalent film','Prevalent watersport','Prevalent hiking',
  'Coffee','Fine arts'
  ];
  Map<String, bool> tagsmap = {
  'Trendy':false, 'Young':false, 'Aging':false, 'Retired':false, 'Golf':false,
  'Winter':false,'Summer Single season':false,'Changing seasons':false,'East coast':false,'Westcoast':false,'Midwest':false,
  'Mountain west':false,'Late night':false,'Early rise':false,'Republican':false,'Democrat':false,'Unaffiliated':false,'History':false,
  'Apartment':false,'House':false,'Small city':false,'Medium city':false,'Large city':false,'Public transport':false,
  'Car':false,'Cycling':false,'Prevalent parks':false,'Outdoor recreation':false,'Near mountains':false,'In mountains':false,
  'Near lakes':false,'Near ocean':false,'On coast':false,'Near beach':false,'Near river':false,'Environmentally friendly':false,
  'Prevalent music':false,'Prevalent art':false,'Prevalent film':false,'Prevalent watersport':false,'Prevalent hiking':false,
  'Coffee':false,'Fine arts':false
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
      secondary: Text(
        "#",
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        )
      ),
      title: Text(
        lesson,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
    Card makeCard(String lesson) =>
        Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: makeListTile(lesson),
          ),
        );
    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: tags.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(tags[index]);
        },
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true ,
        backgroundColor: Color.fromRGBO(36, 135, 195, 1.0),
        leading: new IconButton
          (
            onPressed: () {
              Navigator.pop(
                context
              );                },
            icon: new Icon(Icons.arrow_back, color: Color.fromRGBO(255, 120, 0, 1.0))
        ),
        title: new Padding(
          child: Image.asset('assets/Homwords.png', scale: 0.5),
          padding: EdgeInsets.all(8.0),
        ),
      ),
      body: makeBody,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.white,

        icon: new Icon(Icons.save, color: Color.fromRGBO(18, 22, 25, 1.0)),
        label: new Text("Save", style: TextStyle(color: Color.fromRGBO(18, 22, 25, 1.0))),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );





  }
}