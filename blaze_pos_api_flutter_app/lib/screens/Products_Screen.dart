import 'package:blaze_pos_api_flutter_app/models/Product.dart';
import 'package:blaze_pos_api_flutter_app/models/consumer.dart';
import 'package:blaze_pos_api_flutter_app/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  ProductsScreen({Key? key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  var _searchEdit = TextEditingController();
  bool _isSearch = true;
  String _searchText = "";

  List<Product> _products = List<Product>.empty(growable: true);
  ConsumerUser _consumer = ConsumerUser();
  List<Product> _searchProducts = List<Product>.empty(growable: true);

  @override
  void initState() {
    super.initState();
    Navigator.popUntil(context, (route) => true);
    _searchEdit.addListener(() {
      if (_searchEdit.text.isEmpty) {
        setState(() {
          _isSearch = true;
          _searchText = "";
        });
      } else {
        setState(() {
          _isSearch = false;
          _searchText = _searchEdit.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _consumer = Provider.of<ConsumerUser>(context);
    _products = Provider.of<List<Product>>(context);
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:  (_consumer.cuid == "") 
        ? Center(child: CircularProgressIndicator(),) 
        : Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: (Provider.of<List<Product>>(context).isEmpty)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        child: Card(
                          elevation: 6,
                          child: TextField(
                            controller: _searchEdit,
                            decoration: InputDecoration(
                              hintText: 'Search',
                              icon: Icon(Icons.search),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GridView.count(
                            crossAxisCount: 2,
                            childAspectRatio: 200 / 350,
                            mainAxisSpacing: 15,
                            children: List.generate(
                                _isSearch ? _products.length : _searchListView(),
                                (index) => _isSearch
                                    ? ProductItem(_products[index])
                                    : ProductItem(_searchProducts[index]))),
                      ),
                    ],
                  )),
      ),
    );
  }

  void _searchAddList() {
    _searchProducts.clear();
    for (int i = 0; i < _products.length; i++) {
      var item = _products[i];

      if (item.name.toLowerCase().contains(_searchText.toLowerCase())) {
        if (!_searchProducts.contains(item)) {
          _searchProducts.add(item);
        }
      }
    }
  }

  int _searchListView() {
    _searchAddList();
    print('Size of Search = ' + _searchProducts.length.toString());
    return _searchProducts.length;
  }
}
