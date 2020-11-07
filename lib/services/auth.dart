import 'package:firebase_auth/firebase_auth.dart';
import 'package:therapy_zone/models/user.dart';
import 'package:flutter/material.dart';
import 'package:therapy_zone/services/DatabaseService.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final navigatorKey = GlobalKey<NavigatorState>();

  //create user object based on firebase user

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  // sign in with email & pass
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      return e.message;
    }
  }

  //register with email & pass
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      User thisUser = _userFromFirebaseUser(user);

      await DatabaseService(uid: thisUser.uid)
          .createUserTagInfo("", thisUser.uid, 0, 0, 0, 0, 0, 0);

      return _userFromFirebaseUser(user);
      //creating user taginfo at register
    } catch (e) {
      return e.message;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return e.message;
    }
  }
}
