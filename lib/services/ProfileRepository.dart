import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_maaapp/models/User.dart';
import 'package:flutter_maaapp/models/status.dart';

class ProfileRepository extends ChangeNotifier {
  Status _status = Status.FirstAuth;
  DatabaseReference _database;
  FirebaseAuth _auth;
  UserDetails userDetails;

  ProfileRepository.instance() : _auth = FirebaseAuth.instance {
    _database = FirebaseDatabase.instance.reference();
    _auth.authStateChanges().listen((event) {
      getUserDetails(event.uid);
    });
  }

  Future<bool> addUserDetails(UserDetails userDetails, context, uid) async {
    var user = <String, dynamic>{
      'name': userDetails.name,
      'height': userDetails.height,
      'weight': userDetails.weight,
      'gender': userDetails.gender,
      'age': userDetails.age,
      'email': userDetails.email,
      'photoUrl': userDetails.photoUrl
    };
    try {
      await _database
          .child('Users')
          .child(uid)
          .set(user)
          .then((value) => {print("done")});
      _status = Status.Authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }

  Future<bool> addUserName(username, context, uid) async {
    try {
      await FirebaseDatabase.instance
          .reference()
          .child('Users')
          .child(uid)
          .set(username);
      _status = Status.Authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }

  Future<UserDetails> getUserDetails(uid) async {
    try {
      var gender;
      await _database.child('Users').child(uid).once().then((value) => {
            if (value.value['gender'] == "Gender.Male")
              {gender = "Male"}
            else if (value.value['gender'] == "Gender.Female")
              {gender = "Female"}
            else
              {gender = value.value['gender']},
            userDetails = new UserDetails(
                value.value['name'],
                value.value['height'],
                value.value['weight'],
                gender,
                value.value['age'],
                value.value['email'],
                value.value['photoUrl'])
          });
      notifyListeners();
      return userDetails;
    } catch (e) {
      print(e);
      notifyListeners();
      return null;
    }
  }
}
