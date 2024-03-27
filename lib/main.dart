import 'package:flutter/material.dart';
import 'package:practicetailor/Home.dart';
import 'package:practicetailor/login.dart';
import 'package:practicetailor/profile_input_screen.dart';
import 'package:practicetailor/signup.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: 'login', // Set initial route to login
    routes: {
      'login': (context) => MyLogin(),
      'register': (context) => Mysignup(),
      'home': (context) => TailorProfileScreen(),
      'ProfileInputScreen': (context) => ProfileInputScreen(),
    },
  ));
}
