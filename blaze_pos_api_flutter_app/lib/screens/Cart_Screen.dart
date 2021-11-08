import 'package:blaze_pos_api_flutter_app/models/consumer.dart';
import 'package:blaze_pos_api_flutter_app/providers/cart_provider.dart';
import 'package:blaze_pos_api_flutter_app/providers/consumer_provider.dart';
import 'package:blaze_pos_api_flutter_app/screens/DoB_set_Screen.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:location/location.dart' as loc;
import 'package:geolocator/geolocator.dart';

class CartScreen extends StatefulWidget {
  ConsumerUser _consumer = new ConsumerUser();
  Function _updateCartCount = () {};
  CartScreen(ConsumerUser c, Function i) {
    _consumer = c;
    _updateCartCount = i;
  }

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final loc.Location location = loc.Location();
  Geolocator geolocator = Geolocator();
  late Position userLocation;
  String _address = "";
  double _latitude = 0.0, _longitude = 0.0;
  String _city = "", _country = "", _state = "", _zipCode = "";
  bool _isButtonDisabled = false;

  getLoc() async {
    var currentLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    //print(
    //'Latitude: ${currentLocation.latitude}, Longitude: ${currentLocation.longitude}');

    //_currentPosition = await location.getLocation();
    _getAddress(currentLocation.latitude, currentLocation.longitude)
        .then((value) {
      _address = "${value.first.locality}";
      _latitude = currentLocation.latitude;
      _longitude = currentLocation.longitude;
      _city = value.first.locality.toString();
      _country = value.first.country.toString();
      _state = value.first.administrativeArea.toString();
      _zipCode = value.first.postalCode.toString();
      print('Address: $_address');
    });
  }

  Future<List<geo.Placemark>> _getAddress(double? lat, double? lang) async {
    //final coordinates = new Coordinates(lat, lang);
    List<geo.Placemark> placemarks =
        await geo.placemarkFromCoordinates(lat!, lang!);
    return placemarks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              height: 70,
              child: Row(
                children: [
                  Text(
                    'Total: \$${CartProvider.getCart.getTotalPrice().toString()}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[300],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: ElevatedButton(
                    onPressed: CartProvider.getCart.getItemsLength() == 0
                        ? null
                        : _isButtonDisabled
                            ? null
                            : () {
                                print(widget._consumer.cuid);
                                if (widget._consumer.address.latitude == 0.0 &&
                                    widget._consumer.address.longitude == 0.0) {
                                  getLoc();
                                  ConsumerProvider consumerProvider =
                                      ConsumerProvider();
                                  consumerProvider.addAddressOfUser(
                                    consumerId: widget._consumer.cuid,
                                    latitude: _latitude,
                                    longitude: _longitude,
                                    city: _city,
                                    country: _country,
                                    state: _state,
                                    zipCode: _zipCode,
                                  );
                                  consumerProvider.addAddressOfUser(
                                    consumerId: widget._consumer.cuid,
                                    latitude: _latitude,
                                    longitude: _longitude,
                                    city: _city,
                                    country: _country,
                                    state: _state,
                                    zipCode: _zipCode,
                                  );
                                }
                                CartProvider.setConsumer(widget._consumer);
                                if (widget._consumer.dob == 0) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          DoBSetScreen(
                                        consumer: widget._consumer,
                                      ),
                                    ),
                                  );
                                }
                                CartProvider cartProvider = CartProvider();
                                cartProvider.prepareCart(
                                    consumerId: widget._consumer.cuid);
                                setState(() {
                                  _isButtonDisabled = true;
                                });
                              },
                    child: Text('Buy'),
                  ))
                ],
              ),
            ),
            Container(
                child: Column(
              children: CartProvider.getCart.getItems().map((val) {
                return ListTile(
                  leading: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        image: NetworkImage(val.product.assetpublicURL),
                      ),
                    ),
                  ),
                  title: Text(
                    val.product.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Row(
                    children: [
                      Text(
                        '\$${val.product.unitPrice * val.quantity}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '(x${val.quantity})',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            widget._updateCartCount();
                            setState(() {
                              CartProvider.getCart.removeProduct(val.product);
                            });
                          },
                          icon: Icon(
                            Icons.remove_circle,
                            color: Colors.red[300],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            widget._updateCartCount();
                            setState(() {
                              CartProvider.getCart.addProduct(val.product);
                            });
                          },
                          icon: Icon(
                            Icons.add_circle,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            )),
          ],
        ),
      ),
    );
  }
}
