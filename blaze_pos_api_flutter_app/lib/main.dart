import 'package:blaze_pos_api_flutter_app/providers/Product_provider.dart';
import 'package:blaze_pos_api_flutter_app/screens/Products_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureProvider<String>(create: (ctx) => ProductProvider().getProducts(), initialData: "", child: ProductsScreen(),)
    );
  }
}
