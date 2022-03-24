import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  // const SignUp({Key? key, required this.toggleView}) : super(key: key);
  final Function toggleView;
  SignUp({required this.toggleView});
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // MY FRIENDS TEXT
              Padding(
                padding: const EdgeInsets.only(top: 55),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text('Sign up',
                      style: GoogleFonts.arsenal(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.green)
                      // fontStyle:
                      ),
                ),
              ),
              // Login To your account Text
              SizedBox(
                height: 40,
              ),
              //  Email Text Fields
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: GoogleFonts.arsenal(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          color: Colors.green),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: Colors.greenAccent),
                          gapPadding: 0)),
                ),
              ),
              //  Password TextField
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  obscureText: _hidePassword,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _hidePassword = !_hidePassword;
                          });
                        },
                        icon: Icon(_hidePassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      labelStyle: GoogleFonts.arsenal(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          color: Colors.green),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: Colors.greenAccent),
                          gapPadding: 0)),
                ),
              ),

              //Confirm Password
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  obscureText: _hidePassword,
                  decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _hidePassword = !_hidePassword;
                          });
                        },
                        icon: Icon(_hidePassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      labelStyle: GoogleFonts.arsenal(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          color: Colors.green),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(color: Colors.greenAccent),
                          gapPadding: 0)),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    elevation: MaterialStateProperty.all(0),
                  ),
                  // shape: MaterialStateProperty.all()),
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.arsenal(
                        // color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 22),
                  )),
              SizedBox(
                height: 20,
              ),
              // SIgn in with google account
              Column(
                children: [
                  Text(
                    '_________ Or _________',
                    style: GoogleFonts.arsenal(
                        fontSize: 20, fontStyle: FontStyle.italic),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    minimumSize: MaterialStateProperty.all(Size(100, 40))),
                icon: FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.red,
                ),
                label: Text(
                  'Sign up with Google',
                  style: GoogleFonts.arsenal(fontSize: 15, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //  If You have an account Sign in
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Do you have an account?   ",
                        style: GoogleFonts.arsenal(color: Colors.black)),
                    TextSpan(
                        text: "Sign in",
                        style: GoogleFonts.arsenal(
                            fontSize: 17,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            widget.toggleView();
                          })
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
