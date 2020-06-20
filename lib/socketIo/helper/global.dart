import 'package:chatApplication/socketIo/model/user.dart';

class Global{
  static List<User> users;
  static User loggedInUser;
  static User toChatUser;
  
  static void initUsers(){
    User userA = User(id: 1000, name: "Jacky", email: "jac@gmail.com");
    User userB = User(id: 1001, name: "Tev", email: "tev@gmail.com");
    users = List();
    users.add(userA);
    users.add(userB);

  }

  //if a or b is logged in,should see other users aprt from a or b

  static List<User> getUsersFor(User user){
    List<User> filteredUsers = users.where((u) => (!u.name.toLowerCase().contains(
      user.name.toLowerCase(),
    ))).toList();
    return filteredUsers;
  }
}