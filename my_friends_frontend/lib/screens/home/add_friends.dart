import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../provider/friend.dart';
import '../../widgets/drawer_page.dart';

class AddFriends extends StatefulWidget {
  const AddFriends({Key? key}) : super(key: key);

  @override
  _AddFriendsState createState() => _AddFriendsState();
}

class _AddFriendsState extends State<AddFriends> {
  final _formkey = GlobalKey<FormState>();
  DateTime? date;
  bool favorite = false;
  var friendData = Friend(
      name: '', email: '', birthDay: '', description: '', phoneNumber: '');

  Object getDate() {
    if (date == null) {
      return DateTime.now();
    } else {
      return DateFormat('dd-MM-yyyy').format(date!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Add Friends',
          style: GoogleFonts.arsenal(fontWeight: FontWeight.w400, fontSize: 20),
        ),
      ),
      drawer: const DrawerPage(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formkey,
              // A Column of TextField forms for Adding Friends data.
              child: Column(
                children: [
                  _buildName(),
                  SizedBox(
                    height: 5,
                  ),
                  _buildEmail(),
                  SizedBox(
                    height: 15,
                  ),
                  _buildPhoneNumber(),
                  SizedBox(
                    height: 15,
                  ),
                  _buildBirthDay(),
                  SizedBox(
                    height: 15,
                  ),
                  _buildDescription(),
                  SizedBox(
                    height: 15,
                  ),
                  // Is Favorites
                  Row(
                    children: [
                      Text(
                        'My Favorite',
                        style: GoogleFonts.arsenal(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              favorite = !favorite;
                            });
                          },
                          icon: Icon(
                            Icons.favorite_border_rounded,
                            color: favorite == true ? Colors.red : Colors.grey,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  //The Add Friend Button
                  Container(
                    width: double.maxFinite,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (!_formkey.currentState!.validate()) {
                          return;
                        }
                        _formkey.currentState!.save();
                        print(friendData.name);
                        print(friendData.email);
                        print(friendData.description);
                        print(friendData.phoneNumber);
                        print(date);
                        print(favorite);
                      },
                      child: Text(
                        'Add Friend',
                        style: GoogleFonts.arsenal(fontSize: 20),
                      ),
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(10),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.lightGreen),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.black),
                        // fixedSize: MaterialStateProperty.all()
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Name Text field
  Widget _buildName() {
    return TextFormField(
      maxLength: 20,
      decoration: InputDecoration(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          labelText: 'Name',
          labelStyle: GoogleFonts.arsenal(
              fontSize: 19, color: Colors.grey, fontWeight: FontWeight.w300)),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Name is Required!';
        }
      },
      onSaved: (value) {
        friendData.name = value!;
      },
    );
  }

//  Email Text Field
  Widget _buildEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          labelText: 'Email',
          labelStyle: GoogleFonts.arsenal(
              fontSize: 19, color: Colors.grey, fontWeight: FontWeight.w300)),
      validator: (value) {
        if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value!)) {
          return 'Please enter a valid email.';
        }
      },
      onSaved: (value) {
        friendData.email = value!;
      },
    );
  }

//  Description Text Field
  Widget _buildDescription() {
    return TextFormField(
      maxLines: 4,
      decoration: InputDecoration(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          labelText: 'Description',
          labelStyle: GoogleFonts.arsenal(
              fontSize: 19, color: Colors.grey, fontWeight: FontWeight.w500)),
      validator: (value) {
        if (value!.isEmpty) {
          return null;
        }
      },
      onSaved: (value) {
        friendData.description = value!;
      },
    );
  }

//  Phone Number TextField
  Widget _buildPhoneNumber() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          labelText: 'Phone Number',
          labelStyle: GoogleFonts.arsenal(
              fontSize: 19, color: Colors.grey, fontWeight: FontWeight.w300)),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Phone Number is Required!';
        }
      },
      onSaved: (value) {
        friendData.phoneNumber = value!;
      },
    );
  }

//  Birth date picker widget
  Widget _buildBirthDay() {
    return Container(
      padding: EdgeInsets.only(right: 130),
      child: TextButton(
        onPressed: () {
          _pickBirthDate(context);
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent)),
        child: Text(
          'Birth Day: ${getDate()}',
          style: GoogleFonts.arsenal(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }

//  Date Picker Future Function
  Future _pickBirthDate(BuildContext context) async {
    final intialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: date ?? intialDate,
        firstDate: DateTime(DateTime.now().year - 100),
        lastDate: DateTime(DateTime.now().year + 100));
    if (newDate == null) {
      print('No date picked');
    } else {
      setState(() => date = newDate);
    }
  }
}
