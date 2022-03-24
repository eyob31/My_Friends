import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_friends_frontend/model/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  MyUser? _userFromFirebaseUser(User? user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  // Auth change user stream
  Stream<MyUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //  sign in Anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
//  sign in with  email and password

//sign up with email and password

  // sign out
  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

//Starting from Version firebase_auth 0.18.0:
// FirebaseUser has been changed to User
//
// AuthResult has been changed to UserCredential
//
// GoogleAuthProvider.getCredential() has been changed to GoogleAuthProvider.credential()
//
// onAuthStateChanged which notifies about changes to the user's sign-in state was replaced with authStateChanges()
//
// currentUser() which is a method to retrieve the currently logged in user, was replaced with the property currentUser and it no longer returns a Future<FirebaseUser>
