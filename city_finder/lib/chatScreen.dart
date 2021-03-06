import 'package:city_finder/chatMessage.dart';
import 'package:flutter/material.dart';

bool yeet = true;
class ChatScreen extends StatefulWidget {
  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _chatController = new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];

  void _handleSubmit(String text) {
    _chatController.clear();
    ChatMessage message = new ChatMessage(
        text: text,
        name: true
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _chatEnvironment (){
    return IconTheme(
      data: new IconThemeData(color: Colors.blue),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal:8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                decoration: new InputDecoration.collapsed(hintText: "Start typing ..."),
                controller: _chatController,
                onSubmitted: _handleSubmit,
              ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                icon: new Icon(Icons.send),

                onPressed: ()=> _handleSubmit(_chatController.text),

              ),
            )
          ],
        ),

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if(yeet){
      _messages.insert(0, new ChatMessage(text: "Hey James, this is Sam from Citi Bank", name: false));
      yeet = false;
    }
    return Scaffold(
        appBar: AppBar(
          centerTitle: true ,
          title: new Padding(
            child: Image.asset('assets/Homwords.png', scale: 0.5),
            padding: EdgeInsets.all(8.0),
          ),
          backgroundColor: Color.fromRGBO(36, 135, 195, 1.0),
          leading: new IconButton
        (
        onPressed: () {
          yeet = true;
      Navigator.pop(
          context
      );                },
    icon: new Icon(Icons.arrow_back, color: Color.fromRGBO(255, 120, 0, 1.0))
    ),
        ),
      body: Column(
        children: <Widget>[
          new Flexible(
            child: ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          new Divider(
            height: 1.0,
          ),
          new Container(decoration: new BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
            child: _chatEnvironment(),)
        ],
      ),
    );

  }
}