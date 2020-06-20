import 'package:chatApplication/socketIo/helper/global.dart';
import 'package:chatApplication/socketIo/model/chatMessage.dart';
import 'package:chatApplication/socketIo/model/user.dart';
import 'package:chatApplication/socketIo/screens/chatUserScreen.dart';
import 'package:chatApplication/socketIo/screens/loginScreen.dart';
import 'package:chatApplication/socketIo/widgets/chatTile.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen() : super();
  static const String ROUTE_ID = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  //if a is logged in, this will be a list of users other than a and viceversa
  List<ChatMessage> _chatMessages;
  User _toChatUser;
  UserOnlineStatus _userOnlineStatus;

  @override
  void initState() {
    super.initState();
    _chatMessages = List();
    _toChatUser = Global.toChatUser;
    _userOnlineStatus = UserOnlineStatus.connecting;
  }

  _openLoginScreen(context) async {
    await Navigator.pushReplacementNamed(
      context,
      ChatUserScreen.ROUTE_ID,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                _openLoginScreen(context);
              })
        ],
        title: ChatTitle(
          toChatUser: _toChatUser,
          userOnlineStatus: _userOnlineStatus,
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            Expanded(
                child: ListView.builder(
                    itemCount: _chatMessages.length,
                    itemBuilder: (context, index) {
                      ChatMessage chatMessage = _chatMessages[index];
                      return Text(chatMessage.message);
                    })),
                    _bottomChatArea(),
          ],
        ),
      ),
    );
  }

  _bottomChatArea() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          _chatTextArea(),
          IconButton(icon: Icon(Icons.send), onPressed: () {})
        ],
      ),
    );
  }

  _chatTextArea() {
    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(10.0),
          hintText: 'Type Message',
        ),
      ),
    );
  }
}
