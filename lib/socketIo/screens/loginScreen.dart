import 'package:chatApplication/socketIo/helper/global.dart';
import 'package:chatApplication/socketIo/model/user.dart';
import 'package:chatApplication/socketIo/screens/chatUserScreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen() : super();
  static const String ROUTE_ID = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController;
  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    Global.initUsers();
  }

   


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6.0)),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(20.0),
              ),
            ),
            SizedBox(height: 20.0),
            OutlineButton(
                child: Text('LOGIN'),
                onPressed: () {
                  _loginBtnTap();
                })
          ],
        ),
      ),
    );
  }

  _loginBtnTap() {
    if (_usernameController.text.isEmpty) {
      return;
    }

    //set default user to A
    User user = Global.users[0];
    if(_usernameController.text !='Jacky'){
      user = Global.users[1];
    }
    Global.loggedInUser = user;

    _openChatUsersListScreen(context);
  }

  _openChatUsersListScreen(context) async {
    await Navigator.pushReplacementNamed(
      context,
      ChatUserScreen.ROUTE_ID,
    );
  }
}
