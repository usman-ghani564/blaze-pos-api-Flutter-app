import 'dart:math';

import 'package:blaze_pos_api_flutter_app/models/Product.dart';
import 'package:blaze_pos_api_flutter_app/models/cart.dart';
import 'package:blaze_pos_api_flutter_app/models/consumer.dart';
import 'package:blaze_pos_api_flutter_app/providers/cart_provider.dart';
import 'package:blaze_pos_api_flutter_app/providers/consumer_provider.dart';
import 'package:blaze_pos_api_flutter_app/screens/Cart_Screen.dart';
import 'package:blaze_pos_api_flutter_app/screens/Consumer_SignUp_Login_Screen.dart';
import 'package:blaze_pos_api_flutter_app/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  bool _isLoginPressed = true;
  int _randomNumber = 0;
  ProductsScreen({
    islogin = true,
  }) {
    _isLoginPressed = islogin;
  }

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  ConsumerUser _consumer = ConsumerUser();
  bool _isSearch = true;
  List<Product> _products = List<Product>.empty(growable: true);
  var _searchEdit = TextEditingController();
  List<Product> _searchProducts = List<Product>.empty(growable: true);
  String _searchText = "";

  var scaffoldKey = GlobalKey<ScaffoldState>();

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

  Widget validateLogin() {
    if (widget._isLoginPressed &&
        ConsumerProvider().getLoginError() == "" &&
        _consumer.cuid == "") {
      return CircularProgressIndicator();
    } else if (widget._isLoginPressed &&
        ConsumerProvider().getLoginError() != "") {
      return ConsumerSignUpLoginScreen("Wrong Credentials", true);
    }
    return CircularProgressIndicator();
  }

  int _searchListView() {
    _searchAddList();
    print('Size of Search = ' + _searchProducts.length.toString());
    return _searchProducts.length;
  }

  @override
  Widget build(BuildContext context) {
    _consumer = Provider.of<ConsumerUser>(context);
    _products = Provider.of<List<Product>>(context);

    return (_consumer.cuid == "")
        ? Scaffold(
            body: validateLogin(),
          )
        : Scaffold(
            key: scaffoldKey,
            appBar: ProductsAppBar(context),
            drawer: Drawer(
              elevation: 10,
              child: Column(
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text('Drawer Header'),
                  ),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text(
                      'Logout',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      CartProvider.resetCart();
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ConsumerSignUpLoginScreen("", true),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
            body: ProductsConatiner(context),
          );
  }

  AppBar ProductsAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        onPressed: () => scaffoldKey.currentState?.openDrawer(),
      ),
      backgroundColor: Colors.white,
      title: Container(
          height: 45,
          padding: EdgeInsets.only(bottom: 7),
          child: Image.asset('images/dube_logo.png')),
      actions: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CartScreen(_consumer, _updateCartCount)),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Stack(
              children: [
                Positioned(
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.blue,
                    size: 40,
                  ),
                ),
                Positioned(
                  top: 15,
                  left: 15,
                  child: Container(
                    height: 25,
                    width: 25,
                    child: Center(
                      child: Text(
                        CartProvider.getCart.getItemsLength().toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Container ProductsConatiner(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: (Provider.of<List<Product>>(context).isEmpty)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                TopBanner(context),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
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
                              ? ProductItem(_products[index], _updateCartCount)
                              : ProductItem(
                                  _searchProducts[index], _updateCartCount))),
                ),
              ],
            ),
    );
  }

  void _updateCartCount() {
    setState(() {});
  }

  Container TopBanner(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(_products[getRandomProduct()].assetpublicURL),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.darken,
          ),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Container(
            width: 200,
            child: Text(
              _products[widget._randomNumber].name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            width: 150,
            height: 170,
            child: Card(
              elevation: 10,
              child: Image.network(
                _products[widget._randomNumber].assetpublicURL,
                fit: BoxFit.cover,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          )
        ],
      ),
    );
  }

  int getRandomProduct() {
    Random random = new Random();
    widget._randomNumber = random.nextInt(_products.length + 1);
    return widget._randomNumber;
  }
}
