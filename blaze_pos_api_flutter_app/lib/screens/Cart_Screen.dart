import 'package:blaze_pos_api_flutter_app/models/consumer.dart';
import 'package:blaze_pos_api_flutter_app/providers/cart_provider.dart';
import 'package:blaze_pos_api_flutter_app/providers/consumer_provider.dart';
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
  String _dropdownValue = 'Cash';
  String date = "";
  DateTime selectedDate = DateTime.now();

  int _stepCount = 2;

  int _index = 0;

  var ctx;

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
    _stepCount = (widget._consumer.dob == 0) ? 2 : 1;
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
                                  _setAddress();
                                },
                      child: Text('Buy'),
                    ),
                  )
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

  void _showBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return StatefulBuilder(builder: (ctx, StateSetter setModalState) {
            return Container(
              child: Stepper(
                currentStep: _index,
                onStepCancel: () {
                  if (_index > 0) {
                    setModalState(() {
                      _index -= 1;
                    });
                  }
                },
                onStepContinue: () {
                  if (_index < _stepCount - 1) {
                    setModalState(() {
                      _index += 1;
                    });
                  } else {
                    _index = 0;
                    CartProvider cartProvider = CartProvider(function: (_) {});
                    cartProvider.setPaymentMethod(_dropdownValue);
                    Navigator.pop(context);
                  }
                },
                onStepTapped: (int index) {
                  setModalState(() {
                    _index = index;
                  });
                },
                steps: <Step>[
                  if (widget._consumer.dob == 0) _showDateStep(),
                  Step(
                    title: Text('Add Payment Method'),
                    content: DropdownButton(
                      items: <String>[
                        'Cash',
                        'Aero Pay',
                        'Credit',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setModalState(() {
                          _dropdownValue = newValue!;
                        });
                        CartProvider cartProvider =
                            CartProvider(function: (_) {});
                        cartProvider.setPaymentMethod(_dropdownValue);
                        _index = 0;
                        Navigator.pop(context);
                      },
                      value: _dropdownValue,
                    ),
                  ),
                ],
              ),
            );
          });
        }).then((value) => {
          CartProvider(function: (error) {
            _showSnackBar();
          }).prepareCart(consumerId: widget._consumer.cuid)
        });
    setState(() {
      _isButtonDisabled = true;
    });
  }

  void _setAddress() {
    if (widget._consumer.address.latitude == 0.0 &&
        widget._consumer.address.longitude == 0.0) {
      print("Set address: " + widget._consumer.cuid);
      getLoc();
      ConsumerProvider consumerProvider = ConsumerProvider(sendError: () {});
      consumerProvider.addAddressOfUser(
        consumerId: widget._consumer.cuid,
        latitude: _latitude,
        longitude: _longitude,
        city: _city,
        country: _country,
        state: _state,
        zipCode: _zipCode,
      );
      consumerProvider
          .addAddressOfUser(
            consumerId: widget._consumer.cuid,
            latitude: _latitude,
            longitude: _longitude,
            city: _city,
            country: _country,
            state: _state,
            zipCode: _zipCode,
          )
          .then((value) => _showBottomSheet());
      CartProvider.setConsumerAddress(Address(
        latitude: _latitude,
        longitude: _longitude,
        city: _city,
        country: _country,
        state: _state,
        zipCode: _zipCode,
      ));
    } else {
      _showBottomSheet();
    }
  }

  _selectDate() async {
    bool isDateAdded = true;
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
    ConsumerProvider consumerProvider = ConsumerProvider(
      sendError: (error) {
        isDateAdded = false;
        Navigator.pop(context);
        final snackBar = SnackBar(content: Text(error.toString()));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );

    consumerProvider
        .addDoBOfUser(consumerId: widget._consumer.cuid, dob: d)
        .then((value) => {
              if (isDateAdded)
                {
                  widget._consumer.dob = d,
                  print("Date is added to the consumer!"),
                  CartProvider.setConsumer(widget._consumer)
                }
            });

    //print('Date is: $d');
  }

  Step _showDateStep() {
    return Step(
      title: const Text('Set Date of Birth'),
      content: Container(
        alignment: Alignment.centerLeft,
        child: TextButton(
          onPressed: _selectDate,
          child: Text('select date'),
        ),
      ),
      isActive: _index == 0,
      state: _index > 0 ? StepState.complete : StepState.disabled,
    );
  }

  void _showSnackBar({error = ""}) {
    setState(() {
      _isButtonDisabled = false;
    });
    final snackbar = SnackBar(content: Text(error.toString()));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
