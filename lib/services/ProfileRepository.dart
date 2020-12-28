import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_maaapp/models/User.dart';
import 'package:flutter_maaapp/models/status.dart';

class ProfileRepository extends ChangeNotifier {
  Status _status = Status.FirstAuth;
  DatabaseReference _database;

  ProfileRepository.instance()
      : _database = FirebaseDatabase.instance.reference();

  Future<bool> addUserDetails(UserDetails userDetails, context, uid) async {
    var user = <String, dynamic>{
      'name': userDetails.name,
      'height': userDetails.height,
      'weight': userDetails.weight,
      'gender': userDetails.gender,
      'age': userDetails.age,
      'email': userDetails.email
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

  Future<bool> rootFirebaseIsExists(String uid) async {
    DataSnapshot snapshot = await _database.child("Users").child(uid).once();
    if (snapshot.value == null) {
      print("Item doesn't exist in the db");
    } else {
      print("Item exists in the db");
    }
    return snapshot != null;
  }
}
