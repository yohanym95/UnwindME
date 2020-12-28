import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_maaapp/models/status.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserRepository with ChangeNotifier {
  FirebaseAuth _auth;
  User _user;
  Status _status = Status.Uninitialized;
  DatabaseReference _database;
  GoogleSignIn _googleSignIn;

  UserRepository.instance() : _auth = FirebaseAuth.instance {
    print("loading 2");
    _auth.authStateChanges().listen((event) {
      //print(event.email+"email");
      _onAuthStateChanged(event);
    });
    _database = FirebaseDatabase.instance.reference();
    _googleSignIn = GoogleSignIn();
  }

  Status get status => _status;
  User get user => _user;

  Future<bool> signIn(String email, String password) async {
    try {
      _status = Status.Authenticating;
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => {});
      notifyListeners();
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }

  Future<bool> signUp(String email, String password) async {
    // TODO: implement signUp
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {_status = Status.FirstAuth, notifyListeners()});
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }

  Future signOut() async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<User> _onAuthStateChanged(User firebaseUser) async {
    print("loading");
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      print(_user.uid+"user id");
      DataSnapshot snapshot =
          await _database.child("Users").child(_user.uid).once();
      if (snapshot.value == null) {
        print("Item doesn't exist in the db");
        _status = Status.FirstAuth;
      } else {
        print("Item exists in the db");
        _status = Status.Authenticated;
      }
    }
    notifyListeners();
  }

  Future<User> getCurrentUser() async {
    // TODO: implement getCurrentUser
    _user = await _auth.currentUser;
    notifyListeners();
    print(user.email);
    return user;
  }

  Future<bool> signInWithGoogle() async {
    try {
      print("done");
      final GoogleSignInAccount googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      _status = Status.Authenticating;

      await _auth
          .signInWithCredential(credential)
          .then((value) => {_user = value.user});
      notifyListeners();
      print(_user.email);
      print("done 1");
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }
}
