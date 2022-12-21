import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginapp/homescreen.dart';
import 'package:loginapp/loginscreen.dart';

class authenticate extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null)
      return homescreen();
    else
      return loginscreen();
  }
}
