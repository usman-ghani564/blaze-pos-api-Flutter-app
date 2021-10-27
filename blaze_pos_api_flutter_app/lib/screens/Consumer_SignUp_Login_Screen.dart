import 'package:blaze_pos_api_flutter_app/widgets/login_widget.dart';
import 'package:flutter/material.dart';

class ConsumerSignUpLoginScreen extends StatefulWidget {
  const ConsumerSignUpLoginScreen({ Key? key }) : super(key: key);

  @override
  _ConsumerSignUpLoginScreenState createState() => _ConsumerSignUpLoginScreenState();
}

class _ConsumerSignUpLoginScreenState extends State<ConsumerSignUpLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( 
        child: LoginWidget()
      ),
    );
  }
}