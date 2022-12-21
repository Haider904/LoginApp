import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/loginscreen.dart';
import 'package:email_auth/email_auth.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

Future<User?> CreateAccount(String email, String password) async {
  final dbref = FirebaseDatabase.instance.ref();
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    final UserData = {
      "email": email,
      "handle": "TestUser",
      "company": "UOL",
      "adress": "Gujrat"
    };
    dbref.child('users/' + userCredential.user!.uid).set(UserData);
    return userCredential.user;
  } catch (e) {
    print(e);
    return null;
  }
}

Future<User?> Sigin(String email, String password) async {
  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return userCredential.user;
  } catch (e) {
    print(e);
    return null;
  }
}

logout(BuildContext context) async {
  await _auth.signOut().then((value) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => loginscreen()));
  });
}
