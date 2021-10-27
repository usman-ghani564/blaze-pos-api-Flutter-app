import 'package:blaze_pos_api_flutter_app/providers/Product_provider.dart';
import 'package:blaze_pos_api_flutter_app/screens/Consumer_SignUp_Login_Screen.dart';
import 'package:blaze_pos_api_flutter_app/screens/Products_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/Product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureProvider<List<Product>>(
        create: (ctx) => ProductProvider().getProducts(),
        initialData: List<Product>.empty(),
        child: ConsumerSignUpLoginScreen(),
      ),
    );
  }
}
