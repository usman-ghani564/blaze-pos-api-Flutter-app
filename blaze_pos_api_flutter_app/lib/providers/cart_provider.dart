import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:developer' as dev;

import 'package:blaze_pos_api_flutter_app/models/Product.dart';
import 'package:blaze_pos_api_flutter_app/models/cart.dart';
import 'package:blaze_pos_api_flutter_app/models/consumer.dart';
import 'package:http/http.dart' as http;

class CartProvider {
  static Cart _cart = Cart();
  Function _sendError = () {};
  CartProvider({function}) {
    _sendError = function;
    //print('Consumer Provider is initiallized');
  }

  static Cart get getCart {
    return _cart;
  }

  static void resetCart() {
    _cart = Cart();
  }

  static setConsumer(ConsumerUser c) {
    _cart.consumerUser = c;
  }

  static setConsumerAddress(Address address) {
    _cart.setConsumerAddress(address);
  }

  static void addProductToCart(Product product) {
    _cart.addProduct(product);
  }

  void setPaymentMethod(String pm) {
    _cart.setPaymentMethod(pm);
  }

  void prepareCart({
    String consumerId = "",
  }) async {
    late String _data;
    Map<String, dynamic> jsonData;
    //dev.debugger();
    //print('Came in getActiveConsumer Function');

    final queryParameters = {
      'cuid': consumerId,
    };

    var url = Uri.https('api.partners.blaze.me',
        '/api/v1/partner/store/cart/prepare', queryParameters);

    //dev.log(json.encode(_cart.toJson()));

    // Await the http get response, then decode the json-formatted response.
    await http
        .post(
      url,
      headers: {
        'Authorization': '8a44df0333b44af4bd5b6ad85f45766d',
        'partner_key': '4f90b756ccab4acc8b760b435e76e29d',
        'Content-Type': 'application/json',
      },
      body: json.encode(_cart.toJson()),
    )
        .then((response) {
      //print('Get Request Completed!');
      if (response.statusCode == 200) {
        //print(convert.jsonDecode(response.body) as Map<String, dynamic>);
        _data = (convert.jsonDecode(response.body) as Map<String, dynamic>)
            .toString();

        //print(_data);
        //debugPrint(_data);
        //dev.log(_data);

        jsonData = convert.jsonDecode(response.body) as Map<String, dynamic>;
        print('Cart prepared successfully!');
        getCartByConsumerId(consumerId: consumerId);
        //_cart = Cart.fromJson(jsonData);
      } else {
        print('Request failed with status: ${response.body}.');
        _sendError('An error occcured during process');
        _data = response.statusCode.toString();
      }
    });
  }

  void getCartByConsumerId({
    String consumerId = "",
  }) async {
    late String _data;
    Map<String, dynamic> jsonData;
    //dev.debugger();
    //print('Came in getActiveConsumer Function');

    final queryParameters = {
      'cuid': consumerId,
    };

    var url = Uri.https('api.partners.blaze.me',
        '/api/v1/partner/store/cart/active', queryParameters);

    // Await the http get response, then decode the json-formatted response.
    await http.get(
      url,
      headers: {
        'Authorization': '8a44df0333b44af4bd5b6ad85f45766d',
        'partner_key': '4f90b756ccab4acc8b760b435e76e29d',
        'Content-Type': 'application/json',
      },
    ).then((response) {
      //print('Get Request Completed!');
      if (response.statusCode == 200) {
        convert.jsonDecode(response.body) as Map<String, dynamic>;
        //print(convert.jsonDecode(response.body) as Map<String, dynamic>);
        _data = (convert.jsonDecode(response.body) as Map<String, dynamic>)
            .toString();

        //print(_data);

        jsonData = convert.jsonDecode(response.body) as Map<String, dynamic>;
        _cart.id = jsonData['id'];
        print('cart id: ${_cart.id}');
        submitCart(consumerId: consumerId);
        //_cart = Cart.fromJson(jsonData);
      } else {
        print('Request failed with status: ${response.statusCode}.');
        _sendError('An error occcured during process');
        _data = response.statusCode.toString();
      }
    });
  }

  void submitCart({
    String consumerId = "",
  }) async {
    late String _data;
    Map<String, dynamic> jsonData;
    //dev.debugger();
    //print('Came in getActiveConsumer Function');

    final queryParameters = {
      'cuid': consumerId,
    };

    var url = Uri.https('api.partners.blaze.me',
        '/api/v1/partner/store/cart/submitCart/${_cart.id}', queryParameters);

    // Await the http get response, then decode the json-formatted response.
    await http
        .post(
      url,
      headers: {
        'Authorization': '8a44df0333b44af4bd5b6ad85f45766d',
        'partner_key': '4f90b756ccab4acc8b760b435e76e29d',
        'Content-Type': 'application/json',
      },
      body: json.encode(_cart.toJson()),
    )
        .then((response) {
      //print('Get Request Completed!');
      if (response.statusCode == 200) {
        convert.jsonDecode(response.body) as Map<String, dynamic>;
        //print(convert.jsonDecode(response.body) as Map<String, dynamic>);
        _data = (convert.jsonDecode(response.body) as Map<String, dynamic>)
            .toString();
        print('Cart is submitted');
        print(_data);

        jsonData = convert.jsonDecode(response.body) as Map<String, dynamic>;

        //_cart = Cart.fromJson(jsonData);
      } else {
        print('In cart submit function!');
        print('Request failed with status: ${response.statusCode}.');
        _sendError('An error occcured during process');
        _data = response.statusCode.toString();
      }
    });
  }
}
