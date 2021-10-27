import 'package:blaze_pos_api_flutter_app/models/Product.dart';
import 'package:blaze_pos_api_flutter_app/models/consumer.dart';
import 'package:blaze_pos_api_flutter_app/providers/Product_provider.dart';
import 'package:blaze_pos_api_flutter_app/providers/consumer_provider.dart';
import 'package:blaze_pos_api_flutter_app/screens/Products_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginSignUpLoadingScreen extends StatefulWidget {
  String _email = "";
  String _phoneNumber = "";

  LoginSignUpLoadingScreen(String email, String phone) {
    _email = email;
    _phoneNumber = phone;
  }

  @override
  State<LoginSignUpLoadingScreen> createState() =>
      _LoginSignUpLoadingScreenState();
}

class _LoginSignUpLoadingScreenState extends State<LoginSignUpLoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        FutureProvider<ConsumerUser>(
          create: (ctx) => ConsumerProvider().getActiveConsumer(widget._email, widget._phoneNumber),
          initialData: ConsumerUser(), 
        ),
        FutureProvider<List<Product>>(
          create: (ctx) => ProductProvider().getProducts(),
          initialData: List<Product>.empty(),
        ),
      ],
      child: Scaffold(
            body: ProductsScreen(),
          ),
    );
  }
}
