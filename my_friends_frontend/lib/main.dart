import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'provider/friend.dart';
import 'screens/sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Friends',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignIn(),
      // routes: {},
    );
  }
}
