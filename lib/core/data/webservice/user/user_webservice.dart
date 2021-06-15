import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:myriad_bus_scheduler/core/entity/user/user.dart';

abstract class UserWebService {
  Future<String> updateProfile(UserProfile user);
}

class UserWebServiceImpl implements UserWebService {
  
  final FirebaseDatabase firebaseDatabase;

  UserWebServiceImpl({@required this.firebaseDatabase});
  
  @override
  Future<String> updateProfile(UserProfile user) async {
    try {
      var storageRef = firebaseDatabase.reference();
     await storageRef.child("users").child(user.id).set(user.toMap());
     return "";
    } catch(error) {
      print(error);
      return "unable to update profile";
    }
  }
  
}