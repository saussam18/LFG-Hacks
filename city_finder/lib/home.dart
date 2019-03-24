import 'package:city_finder/cards_section_alignment.dart';
import 'package:city_finder/chatScreen.dart';
import 'package:city_finder/tags.dart';
import 'package:flutter/material.dart';
import 'cards_section_draggable.dart';

PageController _pageController;
City city = new City();

class City {
  final String name = "Minniapolis";
  final String description = "Located in mid-eastern Minnesota, Minneapolis is the largest city in the state, and is a part of the Twin Cities area, along with the state's capital, St. Paul."
      " As the urban center of The Land of 10,000 Lakes, Minneapolis is "
      "known for its lakes and parks, along with its culture and art scenes.";
  final images = [
    "Mpls.jpeg"
  ];
  final tags = [
    "Young", "Midwest", "Late Night"
  ];
}
class SwipeFeedPage extends StatefulWidget
{
  @override
  _SwipeFeedPageState createState() => new _SwipeFeedPageState();
}

class _SwipeFeedPageState extends State<SwipeFeedPage> {

  var currentPageValue = 0.0;
  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
    _pageController.addListener(() {
      setState(() {
        currentPageValue = _pageController.page;
      });
    });
  }
    @override
    Widget build(BuildContext context) {
      return new Scaffold(
          appBar: new AppBar(
            elevation: 0.0,
            centerTitle: true,
            backgroundColor: Colors.blue.shade600,
            leading: new IconButton
              (
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListPage(),
                    ), //MaterialPageRoute
                  );                },
                icon: new Icon(Icons.settings, color: Colors.orange.shade400)
            ),
            actions: <Widget>
            [
              new IconButton
                (
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(),
                      ), //MaterialPageRoute
                    );
                  },
                  icon: new Icon(Icons.chat_bubble, color: Colors.orange.shade400)
              ),
            ],
          ),
          body: PageView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: _pageController,
            itemBuilder: (context, position) {
              if (position == currentPageValue.floor()) {
                return Transform(
                    transform: Matrix4.identity()
                      ..rotateY(currentPageValue - position)
                      ..rotateZ(currentPageValue - position),
                    child: _buildPage()
                );
              } else if (position == currentPageValue.floor() + 1) {
                return Transform(
                    transform: Matrix4.identity()
                      ..rotateY(currentPageValue - position)
                      ..rotateZ(currentPageValue - position),
                    child: _buildPage()
                );
              } else {
                _buildPage();
              }
            },
            itemCount: 2,
          )
      );
    }

    _buildPage(){
    return new Container(
        decoration: new BoxDecoration(color: Colors.white,),
        child: Stack(
        children: <Widget>[
          /*ClipPath(
            child: Container(color: Colors.black.withOpacity(0.8)),
            clipper: getClipper(),
          ),*/
          ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      city.name,
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Container(
                        width:  MediaQuery.of(context).size.width,
                        height: 300.0,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          image: DecorationImage(
                              image: ExactAssetImage("assets/mplsnite.jpg"),
                              fit: BoxFit.cover
                          ),
                        )),
                  ),
                  Container(

                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Text(
                      city.description,
                      style: TextStyle(
                          fontSize: 17.0,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Matching Tags",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Container(
                      height: 100.0,
                      width: 350.0,
                      child: ListView.builder(
                        itemCount: city.tags.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text('#${city.tags[index]}'),
                          );
                        },
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      )
    );

    }


    @override
    void dispose() {
      super.dispose();
      _pageController.dispose();
    }
  }
class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
