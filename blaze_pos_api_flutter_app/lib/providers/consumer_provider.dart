import 'dart:convert' as convert;
import 'dart:developer' as dev;

import 'package:blaze_pos_api_flutter_app/models/consumer.dart';
import 'package:http/http.dart' as http;

class ConsumerProvider {
  ConsumerUser _consumer = ConsumerUser();
  ConsumerProvider() {
    print('Consumer Provider is initiallized');
  }

  ConsumerUser get getConsumer {
    return _consumer;
  }

  Future<ConsumerUser> getActiveConsumer(
      String email, String phoneNumber) async {
    late String _data;
    Map<String, dynamic> jsonData;

    if (email == "" && phoneNumber == "") {
      return _consumer;
    }

    final queryParameters = {
      'email': email,
      'phoneNumber': phoneNumber,
    };

    print('Came in getActiveConsumer Function');
    var url = Uri.https(
        'api.partners.blaze.me', '/api/v1/partner/user/find', queryParameters);

    // Await the http get response, then decode the json-formatted response.
    await http.get(url, headers: {
      'Authorization': '8a44df0333b44af4bd5b6ad85f45766d',
      'partner_key': '4f90b756ccab4acc8b760b435e76e29d'
    }).then((response) {
      print('Get Request Completed!');
      if (response.statusCode == 200) {
        convert.jsonDecode(response.body) as Map<String, dynamic>;
        //print(convert.jsonDecode(response.body) as Map<String, dynamic>);
        _data = (convert.jsonDecode(response.body) as Map<String, dynamic>)
            .toString();

        print(_data);

        jsonData = convert.jsonDecode(response.body) as Map<String, dynamic>;
        //dev.debugger();
        _consumer = ConsumerUser.fromJson(jsonData);
      } else {
        print('Request failed with status: ${response.statusCode}.');
        _data = response.statusCode.toString();
      }
    });
    return _consumer;
  }
}
