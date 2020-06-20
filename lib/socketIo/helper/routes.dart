
import 'package:chatApplication/socketIo/screens/chatScreen.dart';
import 'package:chatApplication/socketIo/screens/chatUserScreen.dart';
import 'package:chatApplication/socketIo/screens/loginScreen.dart';

class Routes{
  static routes(){
    return{
      LoginScreen.ROUTE_ID: (context) => LoginScreen(),
      ChatUserScreen.ROUTE_ID: (context) => ChatUserScreen(),
      ChatScreen.ROUTE_ID: (context) => ChatScreen()

    };
  }

   static initScreen(){
      return LoginScreen.ROUTE_ID;
    }
}