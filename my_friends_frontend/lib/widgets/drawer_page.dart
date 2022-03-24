import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_friends_frontend/services/auth.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Container(
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 50,
                    child: Icon(
                      Icons.person,
                      size: 50,
                    ),
                  ),
                  Text(
                    'Eyob Yifru',
                    style:
                        GoogleFonts.arsenal(color: Colors.white, fontSize: 28),
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: <Color>[Colors.green, Colors.orangeAccent])),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              await _auth.signOut();
            },
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log out'),
            ),
          ),
        ],
      ),
    );
  }
}
