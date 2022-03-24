import 'package:flutter/material.dart';
import 'package:my_friends_frontend/model/user.dart';
import 'package:my_friends_frontend/provider/google_signin.dart';
import 'package:my_friends_frontend/screens/home/add_friends.dart';
import 'package:my_friends_frontend/screens/home_page.dart';
import 'package:my_friends_frontend/screens/wrapper.dart';
import 'package:my_friends_frontend/services/auth.dart';
import 'package:my_friends_frontend/widgets/home_page.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'provider/friend.dart';
import 'screens/authenticate/sign_in.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This is the root of the application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Friends',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Wrapper(),
        // routes: {},
      ),
    );
  }
}
