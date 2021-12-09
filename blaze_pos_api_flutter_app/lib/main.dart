import 'package:blaze_pos_api_flutter_app/screens/Consumer_SignUp_Login_Screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ConsumerSignUpLoginScreen("", true);
  }
}
