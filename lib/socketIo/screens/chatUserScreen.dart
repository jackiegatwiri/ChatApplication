import 'package:chatApplication/socketIo/helper/global.dart';
import 'package:chatApplication/socketIo/model/user.dart';
import 'package:chatApplication/socketIo/screens/chatScreen.dart';
import 'package:chatApplication/socketIo/screens/loginScreen.dart';
import 'package:flutter/material.dart';

class ChatUserScreen extends StatefulWidget {
  ChatUserScreen() : super();
  static const String ROUTE_ID = 'chat_users_screen';

  @override
  _ChatUserScreenState createState() => _ChatUserScreenState();
}

class _ChatUserScreenState extends State<ChatUserScreen> {
  //if a is logged in, this will be a list of users other than a and viceversa
  List<User> _chatUsers;

  @override
  void initState() {
    super.initState();
    _chatUsers = Global.getUsersFor(Global.loggedInUser);
  }

  _openLoginScreen(context) async {
    await Navigator.pushReplacementNamed(
      context,
      LoginScreen.ROUTE_ID,
    );
  }

  _openChatScreen(context) async {
    await Navigator.pushReplacementNamed(
      context,
      ChatScreen.ROUTE_ID,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Users"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _openLoginScreen(context);
              })
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            Expanded(
                child: ListView.builder(
                    itemCount: _chatUsers.length,
                    itemBuilder: (context, index) {
                      User user = _chatUsers[index];
                      return ListTile(
                        onTap: () {
                          Global.toChatUser = user;
                          _openChatScreen(context);
                        },
                        title: Text(user.name),
                        subtitle: Text('ID ${user.id}, Email: ${user.email}'),
                      );
                    })),
          ],
        ),
      ),
    );
  }


}
