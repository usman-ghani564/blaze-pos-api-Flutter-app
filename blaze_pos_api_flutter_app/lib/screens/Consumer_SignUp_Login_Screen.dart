import 'package:blaze_pos_api_flutter_app/widgets/login_widget.dart';
import 'package:blaze_pos_api_flutter_app/widgets/signup_widget.dart';
import 'package:flutter/material.dart';

class ConsumerSignUpLoginScreen extends StatefulWidget {
  String _error = "";
  bool _isLogin = true;
  ConsumerSignUpLoginScreen(String e, bool islogin) {
    _error = e;
    _isLogin = islogin;
  }

  @override
  _ConsumerSignUpLoginScreenState createState() =>
      _ConsumerSignUpLoginScreenState();
}

class _ConsumerSignUpLoginScreenState extends State<ConsumerSignUpLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: widget._isLogin ? LoginWidget(widget._error) : SignupWidget(),
      ),
    );
  }
}
