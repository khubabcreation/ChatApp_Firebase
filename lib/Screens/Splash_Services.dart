import 'dart:async';
import 'package:chatapp/Screens/HomeScreen.dart';
import 'package:chatapp/Screens/SignIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashServices {
    isLogin(BuildContext context) {

    FirebaseAuth auth = FirebaseAuth.instance;

    var user = auth.currentUser;
    if (user != null) {
      Timer(
        Duration(seconds: 1),
        () => Navigator.push(context, MaterialPageRoute(
          builder: (context) => HomeScreen(),)
        ),
      );
    } else {
      Timer(
        Duration(seconds: 1),
        () => Navigator.push(context, MaterialPageRoute(
    builder: (context) => SignIn(),)
        ),
      );
    }
  }
}
