import 'package:blaze_pos_api_flutter_app/models/Product.dart';
import 'package:blaze_pos_api_flutter_app/models/cart.dart';
import 'package:blaze_pos_api_flutter_app/models/consumer.dart';
import 'package:blaze_pos_api_flutter_app/providers/Product_provider.dart';
import 'package:blaze_pos_api_flutter_app/providers/cart_provider.dart';
import 'package:blaze_pos_api_flutter_app/providers/consumer_provider.dart';
import 'package:blaze_pos_api_flutter_app/screens/Products_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginSignUpLoadingScreen extends StatefulWidget {
  String _email = "";
  String _phoneNumber = "";
  String _firstName = "";
  String _lastName = "";
  String _sex = "";
  String _password = "";
  int _dob = 0;
  bool _isLoginPressed = false;

  LoginSignUpLoadingScreen(
      {String email = "",
      String phone = "",
      bool islogin = false,
      String fn = "",
      String ln = "",
      String pass = "",
      int dateOfBirth = 0,
      String sex = ""}) {
    _email = email;
    _phoneNumber = phone;
    _firstName = fn;
    _lastName = ln;
    _password = pass;
    _dob = dateOfBirth;
    _sex = sex;
    _isLoginPressed = islogin;
  }

  @override
  State<LoginSignUpLoadingScreen> createState() =>
      _LoginSignUpLoadingScreenState();
}

class _LoginSignUpLoadingScreenState extends State<LoginSignUpLoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        widget._isLoginPressed
            ? FutureProvider<ConsumerUser>(
                create: (ctx) => ConsumerProvider()
                    .getActiveConsumer(widget._email, widget._phoneNumber),
                initialData: ConsumerUser(),
              )
            : FutureProvider<ConsumerUser>(
                create: (ctx) => ConsumerProvider().getSignupConsumer(
                  email: widget._email,
                  password: widget._password,
                  firstName: widget._firstName,
                  lastName: widget._lastName,
                  dob: widget._dob,
                  sex: widget._sex,
                  phoneNumber: widget._phoneNumber,
                ),
                initialData: ConsumerUser(),
              ),
        FutureProvider<List<Product>>(
          create: (ctx) => ProductProvider().getProducts(),
          initialData: List<Product>.empty(),
        ),
      ],
      child: Scaffold(
        body: ProductsScreen(islogin: widget._isLoginPressed),
      ),
    );
  }
}
