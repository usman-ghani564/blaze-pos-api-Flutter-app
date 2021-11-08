import 'dart:ffi';

import 'package:blaze_pos_api_flutter_app/models/Product.dart';
import 'package:blaze_pos_api_flutter_app/models/consumer.dart';
import 'package:blaze_pos_api_flutter_app/providers/cart_provider.dart';
import 'package:blaze_pos_api_flutter_app/providers/consumer_provider.dart';
import 'package:blaze_pos_api_flutter_app/screens/Login_signup_loading_screen.dart';
import 'package:blaze_pos_api_flutter_app/screens/Products_Screen.dart';
import 'package:flutter/material.dart';

class DoBSetScreen extends StatefulWidget {
  ConsumerUser _consumerUser = ConsumerUser();
  DoBSetScreen({consumer}) {
    _consumerUser = consumer;
  }

  @override
  _DoBSetScreenState createState() => _DoBSetScreenState();
}

class _DoBSetScreenState extends State<DoBSetScreen> {
  String date = "";
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Text(
                  'It takes 30 seconds to complete the profile :)',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700]),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _selectDate();
                      CartProvider cartProvider = CartProvider();
                      cartProvider.prepareCart(
                          consumerId: widget._consumerUser.cuid);
                    },
                    child: Text('Set Date of Birth'),
                  ),
                )
              ],
            )),
      ),
    );
  }

  _selectDate() async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime(2001),
      firstDate: DateTime(1940),
      lastDate: DateTime(2001),
      helpText: "Select Date of Birth",
      confirmText: "Done",
      fieldHintText: "DD/MM/YY",
      fieldLabelText: "Date of Birth",
      errorFormatText: "Enter a Valid Date",
      errorInvalidText: "User should be atleast 21 years old!",
      initialEntryMode: DatePickerEntryMode.inputOnly,
    );
    if (selected != null && selected != selectedDate) selectedDate = selected;
    int d = ((selectedDate.microsecondsSinceEpoch) ~/ 1000000).toInt();
    widget._consumerUser.dob = d;
    ConsumerProvider consumerProvider = ConsumerProvider();
    consumerProvider.addDoBOfUser(
        consumerId: widget._consumerUser.cuid, dob: d);

    //print('Date is: $d');
    CartProvider.setConsumer(widget._consumerUser);
  }
}
