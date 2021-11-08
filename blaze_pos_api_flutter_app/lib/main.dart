import 'package:blaze_pos_api_flutter_app/screens/Consumer_SignUp_Login_Screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ConsumerSignUpLoginScreen("", true),
    );
  }
}
