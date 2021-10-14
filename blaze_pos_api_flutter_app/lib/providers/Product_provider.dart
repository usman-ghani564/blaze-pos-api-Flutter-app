import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class ProductProvider {
  ProductProvider() {
    print('Product Provider is initiallized');
  }
  Future<String> getProducts() async {
    late String _data;
    print('Came in getProducts Function');
    var url = Uri.https('api.partners.blaze.me',
        '/api/v1/partner/store/inventory/products');

    // Await the http get response, then decode the json-formatted response.
    await http.get(url, headers: {
      'Authorization': '8a44df0333b44af4bd5b6ad85f45766d',
      'partner_key': '4f90b756ccab4acc8b760b435e76e29d'
    }).then((response) {
      print('Get Request Completed!');
      if (response.statusCode == 200) {
        convert.jsonDecode(response.body) as Map<String, dynamic>;
        print(convert.jsonDecode(response.body) as Map<String, dynamic>);
        _data = (convert.jsonDecode(response.body) as Map<String, dynamic>)
            .toString();
      } else {
        print('Request failed with status: ${response.statusCode}.');
        _data = response.statusCode.toString();
      }
    });
    return _data;
  }
}
