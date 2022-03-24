import 'package:flutter/material.dart';
import 'package:my_friends_frontend/model/user.dart';
import 'package:my_friends_frontend/screens/authenticate/authenticate.dart';
import 'package:my_friends_frontend/screens/home/add_friends.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    print(user);
    //returns either the Home or Authenticqte widget
    if (user == null) {
      return Authenticate();
    } else {
      return AddFriends();
    }
  }
}
