import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_friends_frontend/provider/google_signin.dart';
import 'package:my_friends_frontend/screens/sign_up.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _emailController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _hidePassword = true;
  @override
  void initState() {
    super.initState();
    _emailController.addListener(onListen);
  }

  @override
  void dispose() {
    _emailController.removeListener(onListen);
    super.dispose();
  }

  void onListen() {
    setState(() {});
  }

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
                  child: Text('My Friends',
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
              Padding(
                padding: EdgeInsets.only(top: 60, right: 110),
                child: Text(
                  'Sign in to your account',
                  style: GoogleFonts.arsenal(
                      fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //Sign In Form
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    //  Email Text Fields
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: _emailController,
                        textInputAction: TextInputAction.next,
                        focusNode: _emailFocusNode,
                        onFieldSubmitted: (_) {
                          Focus.of(context).requestFocus(_passwordFocusNode);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Email Please";
                          } else if (RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return null;
                          } else {
                            return "Enter a Valid Email";
                          }
                        },
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            labelText: 'Email',
                            suffixIcon: _emailController.text.isEmpty
                                ? Container(
                                    width: 0,
                                  )
                                : IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _emailController.clear();
                                      });
                                    },
                                    icon: Icon(
                                      Icons.cancel,
                                      color: Colors.green,
                                    )),
                            labelStyle: GoogleFonts.arsenal(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic,
                                color: Colors.green),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide:
                                    BorderSide(color: Colors.greenAccent),
                                gapPadding: 0)),
                        autofillHints: [AutofillHints.email],
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    //  Password TextField
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        focusNode: _passwordFocusNode,
                        obscureText: _hidePassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your Password Please';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            labelText: 'Password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _hidePassword = !_hidePassword;
                                });
                              },
                              icon: Icon(
                                _hidePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.green,
                              ),
                            ),
                            labelStyle: GoogleFonts.arsenal(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic,
                                color: Colors.green),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide:
                                    BorderSide(color: Colors.greenAccent),
                                gapPadding: 0)),
                      ),
                    ),
                  ],
                ),
              ),
              //  Sign In Button
              TextButton(
                  onPressed: () {
                    _formKey.currentState!.validate();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    elevation: MaterialStateProperty.all(0),
                  ),
                  // shape: MaterialStateProperty.all()),
                  child: Text(
                    'Sign In',
                    style: GoogleFonts.arsenal(
                        color: Colors.green,
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
                    'Or Sign in with: ',
                    style: GoogleFonts.arsenal(
                        fontSize: 15, fontStyle: FontStyle.italic),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSigninProvider>(context, listen: false);
                  provider.googleLogin();
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    minimumSize:
                        MaterialStateProperty.all(const Size(100, 40))),
                icon: const FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.white,
                ),
                label: Text(
                  'Sign in with Google',
                  style: GoogleFonts.arsenal(fontSize: 15, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              //  Don't have an account text
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Don't have an account?  ",
                        style: GoogleFonts.arsenal(color: Colors.black)),
                    TextSpan(
                        text: "Sign up",
                        style: GoogleFonts.arsenal(
                            fontSize: 17,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()..onTap = goToSignUp)
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void goToSignUp() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }
}
