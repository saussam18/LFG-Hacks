import 'package:city_finder/chatScreen.dart';
import 'package:city_finder/tags.dart';
import 'package:flutter/material.dart';

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

class _SwipeFeedPageState extends State<SwipeFeedPage> with TickerProviderStateMixin {

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
                    child: _buildProductDetailsPage(context),
                );
              } else if (position == currentPageValue.floor() + 1) {
                return Transform(
                    transform: Matrix4.identity()
                      ..rotateY(currentPageValue - position)
                      ..rotateZ(currentPageValue - position),
                    child: _buildProductDetailsPage(context),
                );
              } else {
                _buildProductDetailsPage(context);
              }
            },
            itemCount: 2,
          )
      );
    }

  _buildProductDetailsPage(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ListView(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(4.0),
          child: Card(
            elevation: 4.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildProductImagesWidgets(),
                _buildProductTitleWidget(),
                SizedBox(height: 12.0),
                _buildPriceWidgets(),
                SizedBox(height: 12.0),
                _buildDivider(screenSize),
                SizedBox(height: 12.0),
                _buildFurtherInfoWidget(),
                SizedBox(height: 12.0),
                _buildDivider(screenSize),
                SizedBox(height: 12.0),
                _buildSizeChartWidgets(),
                SizedBox(height: 12.0),
                _buildDetailsAndMaterialWidgets(),
                SizedBox(height: 12.0),
                _buildStyleNoteHeader(),
                SizedBox(height: 6.0),
                _buildDivider(screenSize),
                SizedBox(height: 4.0),
                _buildStyleNoteData(),
                SizedBox(height: 20.0),
                _buildMoreInfoHeader(),
                SizedBox(height: 6.0),
                _buildDivider(screenSize),
                SizedBox(height: 4.0),
                _buildMoreInfoData(),
                SizedBox(height: 24.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
  _buildDivider(Size screenSize) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.grey[600],
          width: screenSize.width,
          height: 0.25,
        ),
      ],
    );
  }
  _buildProductImagesWidgets() {
    TabController imagesController = TabController(length: 3, vsync: this);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 250.0,
        child: Center(
          child: DefaultTabController(
            length: 3,
            child: Stack(
              children: <Widget>[
                TabBarView(
                  controller: imagesController,
                  children: <Widget>[
                    Image.asset("assets/Mpls.jpeg"),
                    Image.asset("assets/mplsnite.jpg"),
                    Image.asset("assets/person.png"),
                  ],
                ),
                Container(
                  alignment: FractionalOffset(0.5, 0.95),
                  child: TabPageSelector(
                    controller: imagesController,
                    selectedColor: Colors.grey,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  _buildProductTitleWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Center(
        child: Text(
          //name,
          city.name,
          style: TextStyle(fontSize: 16.0, color: Colors.black),
        ),
      ),
    );
  }
  _buildPriceWidgets() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            "87\% Match",
            style: TextStyle(fontSize: 16.0, color: Colors.black),
          ),
          SizedBox(
            width: 8.0,
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            "Your Highest City Match",
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.blue[700],
            ),
          ),
        ],
      ),
    );
  }

  _buildFurtherInfoWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.local_offer,
            color: Colors.grey[500],
          ),
          SizedBox(
            width: 12.0,
          ),
          Text(
            "#Young #Hot #Seasonal #Lakes #GoodVibes",
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
  _buildSizeChartWidgets() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.straighten,
                color: Colors.grey[600],
              ),
              SizedBox(
                width: 12.0,
              ),
              Text(
                "Population: 422,000",
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  _buildDetailsAndMaterialWidgets() {
    TabController tabController = new TabController(length: 2, vsync: this);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TabBar(
            controller: tabController,
            tabs: <Widget>[
              Tab(
                child: Text(
                  "Description",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Companies",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            height: 60.0,
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                Text(
                  city.description,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Great Place to live",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
  _buildStyleNoteHeader() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
      ),
      child: Text(
        "Tax Information",
        style: TextStyle(
          color: Colors.grey[800],
        ),
      ),
    );
  }
  _buildStyleNoteData() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
      ),
      child: Text(
        "No income Tax",
        style: TextStyle(
          color: Colors.grey[600],
        ),
      ),
    );
  }
  _buildMoreInfoHeader() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
      ),
      child: Text(
        "Additonal Info",
        style: TextStyle(
          color: Colors.grey[800],
        ),
      ),
    );
  }
  _buildMoreInfoData() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
      ),
      child: Text(
        "Friendly People",
        style: TextStyle(
          color: Colors.grey[600],
        ),
      ),
    );
  }


  @override
    void dispose() {
      super.dispose();
      _pageController.dispose();
    }
  }
