import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_friends_frontend/screens/sign_in.dart';
import 'package:my_friends_frontend/screens/sign_up.dart';

import '../screens/home_page_screen.dart';

class HomePage extends StatelessWidget with ChangeNotifier {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.green,
              ));
            } else if (snapshot.hasData) {
              return HomePageScreen();
            } else if (snapshot.hasError) {
              return Center(child: Text("Something Went Wrong"));
            } else {
              return SignIn();
            }
          }));

}
