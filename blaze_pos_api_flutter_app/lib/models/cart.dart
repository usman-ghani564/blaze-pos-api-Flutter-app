import 'package:blaze_pos_api_flutter_app/models/Product.dart';
import 'package:blaze_pos_api_flutter_app/models/consumer.dart';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';

class Cart {
  Cart({
    id = "",
    accepted = false,
    acceptedTime = 0,
    cartStatus = "",
    companyId = "",
    completed = false,
    completedTime = 0,
    consumerId = "",
    deliveryDate = 0,
    employeeName = "",
    inventoryId = "",
    memberId = "",
    packaged = false,
    packagedTime = 0,
    pickUpDate = 0,
    pickUpType = "",
    complainceId = "",
    publicKey = "",
    sessionId = "",
    shopId = "",
    source = "",
    terminalId = "",
    trackingStatus = "",
    transNo = "",
    transactionId = "",
    transactionSource = "",
    consumer,
    items,
    deliveryFee = 0.0,
    total = 0.0,
  }) {
    this._id = id == null ? "" : id;
    this._accepted = accepted;
    this._acceptedTime = acceptedTime;
    this._cartStatus = cartStatus;
    this._companyId = companyId;
    this._completed = completed;
    this._completedTime = completedTime;
    this._consumerId = consumerId == null ? "" : consumerId;
    this._deliveryDate = deliveryDate;
    this._inventoryId = inventoryId;
    this._memberId = memberId;
    this._packaged = packaged;
    this._packagedTime = packagedTime;
    this._pickUpDate = pickUpDate;
    this._pickUpType = pickUpType;
    this._complianceId = complainceId;
    this._publicKey = publicKey;
    this._sessionId = sessionId;
    this._shopId = shopId;
    this._source = source;
    this._terminalId = terminalId;
    this._trackingStatus = trackingStatus;
    this._transNo = transNo;
    this._transactionId = transactionId;
    this._transactionSource = transactionSource;
    this._consumerUser = consumer == null ? ConsumerUser() : consumer;
    this._items = items == null ? Items() : items;
    this._deliveryFee = deliveryFee;
    this._total = total;
  }

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'] as String,
      accepted: json['accepted'] == null ? false : json['accepted'] as bool,
      acceptedTime:
          json['acceptedTime'] == null ? 0 : json['acceptedTime'] as int,
      cartStatus:
          json['cartStatus'] == null ? "" : json['cartStatus'] as String,
      companyId: json['companyId'] == null ? "" : json['companyId'] as String,
      completed: json['completed'] == null ? false : json['completed'] as bool,
      completedTime:
          json['completedTime'] == null ? 0 : json['completedTime'] as int,
      consumerId:
          json['consumerId'] == null ? "" : json['consumerId'] as String,
      deliveryDate:
          json['deliveryDate'] == null ? 0 : json['deliveryDate'] as int,
      employeeName:
          json['employeeName'] == null ? "" : json['employeeName'] as String,
      inventoryId:
          json['inventoryId'] == null ? "" : json['inventoryId'] as String,
      memberId: json['memberId'] == null ? "" : json['memberId'] as String,
      packaged: json['packaged'] == null ? false : json['packaged'] as bool,
      packagedTime:
          json['packagedTime'] == null ? 0 : json['packagedTime'] as int,
      pickUpDate: json['pickUpDate'] == null ? 0 : json['pickUpDate'] as int,
      pickUpType:
          json['pickUpType'] == null ? "" : json['pickUpType'] as String,
      complainceId:
          json['complainceId'] == null ? "" : json['complainceId'] as String,
      publicKey: json['publicKey'] == null ? "" : json['publicKey'] as String,
      sessionId: json['sessionId'] == null ? "" : json['sessionId'] as String,
      shopId: json['shopId'] == null ? "" : json['shopId'] as String,
      source: json['source'] == null ? "" : json['source'] as String,
      terminalId:
          json['terminalId'] == null ? "" : json['terminalId'] as String,
      trackingStatus: json['trackingStatus'] == null
          ? ""
          : json['trackingStatus'] as String,
      transNo: json['transNo'] == null ? "" : json['transNo'] as String,
      transactionId:
          json['transactionId'] == null ? "" : json['transactionId'] as String,
      transactionSource: json['transactionSource'] == null
          ? ""
          : json['transactionSource'] as String,
      consumer: json['consumerUser'] == null
          ? ConsumerUser()
          : ConsumerUser.fromJson(json['consumerUser']),
      deliveryFee: json['cart']['deliveryFee'] == null
          ? 0.0
          : json['cart']['deliveryFee'] as double,
      total:
          json['cart']['total'] == null ? 0.0 : json['cart']['total'] as double,
      items: json['cart'] == null ? Items() : Items.fromJson(json['cart']),
    );
  }

  bool _accepted = false;
  int _acceptedTime = 0;
  String _cartStatus = "";
  String _companyId = "";
  bool _completed = false;
  int _completedTime = 0;
  String _complianceId = "";
  String _consumerId = "";
  ConsumerUser _consumerUser = ConsumerUser();
  int _deliveryDate = 0;
  double _deliveryFee = 0.0;
  String _employeeName = "";
  String _id = "";
  String _inventoryId = "";
  Items _items = Items();
  String _memberId = "";
  bool _packaged = false;
  int _packagedTime = 0;
  int _pickUpDate = 0;
  String _pickUpType = "";
  String _publicKey = "";
  String _sessionId = "";
  String _shopId = "";
  String _source = "";
  String _terminalId = "";
  double _total = 0.0;
  String _trackingStatus = "";
  String _transNo = "";
  String _transactionId = "";
  String _transactionSource = "";

  void setPaymentMethod(String pm) {
    _items._paymentOption = pm;
  }

  void setConsumerAddress(Address a) {
    _consumerUser.address = a;
  }

  void addProduct(Product product) {
    _items.addProduct(product);
  }

  void removeProduct(Product p) {
    _items.removeProduct(p);
  }

  List<Item> getItems() {
    return _items._iitems;
  }

  int getItemsLength() {
    return _items.getlength();
  }

  String getPaymentOption() {
    return _items.paymentOption;
  }

  double getTotalPrice() => _items.geTotalPrice();

  get accepted => this._accepted;

  set accepted(value) => this._accepted = value;

  get acceptedTime => this._acceptedTime;

  set acceptedTime(value) => this._acceptedTime = value;

  get cartStatus => this._cartStatus;

  set cartStatus(value) => this._cartStatus = value;

  get companyId => this._companyId;

  set companyId(value) => this._companyId = value;

  get completed => this._completed;

  set completed(value) => this._completed = value;

  get completedTime => this._completedTime;

  set completedTime(value) => this._completedTime = value;

  get complianceId => this._complianceId;

  set complianceId(value) => this._complianceId = value;

  get consumerId => this._consumerId;

  set consumerId(value) => this._consumerId = value;

  get consumerUser => this._consumerUser;

  set consumerUser(value) => this._consumerUser = value;

  get deliveryDate => this._deliveryDate;

  set deliveryDate(value) => this._deliveryDate = value;

  get deliveryFee => this._deliveryFee;

  set deliveryFee(value) => this._deliveryFee = value;

  get employeeName => this._employeeName;

  set employeeName(value) => this._employeeName = value;

  get id => this._id;

  set id(value) => this._id = value;

  get inventoryId => this._inventoryId;

  set inventoryId(value) => this._inventoryId = value;

  get memberId => this._memberId;

  set memberId(value) => this._memberId = value;

  get packaged => this._packaged;

  set packaged(value) => this._packaged = value;

  get packagedTime => this._packagedTime;

  set packagedTime(value) => this._packagedTime = value;

  get pickUpDate => this._pickUpDate;

  set pickUpDate(value) => this._pickUpDate = value;

  get pickUpType => this._pickUpType;

  set pickUpType(value) => this._pickUpType = value;

  get items => this._items;

  set items(value) => this._items = value;

  get publicKey => this._publicKey;

  set publicKey(value) => this._publicKey = value;

  get sessionId => this._sessionId;

  set sessionId(value) => this._sessionId = value;

  get shopId => this._shopId;

  set shopId(value) => this._shopId = value;

  get source => this._source;

  set source(value) => this._source = value;

  get terminalId => this._terminalId;

  set terminalId(value) => this._terminalId = value;

  get total => this._total;

  set total(value) => this._total = value;

  get trackingStatus => this._trackingStatus;

  set trackingStatus(value) => this._trackingStatus = value;

  get transNo => this._transNo;

  set transNo(value) => this._transNo = value;

  get transactionId => this._transactionId;

  set transactionId(value) => this._transactionId = value;

  get transactionSource => this._transactionSource;

  set transactionSource(value) => this._transactionSource = value;

  Map toJson() => {
        'cart': _items.toJson(),
        'consumerUser': this._consumerUser.toJson(),
      };
}

class Items {
  Items({
    paymentOption = "",
    items,
  }) {
    this._paymentOption = paymentOption;
    if (items != null) {
      this._iitems = items;
    }
  }

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      paymentOption:
          json['paymentOption'] == null ? "Cash" : json['paymentOption'],
      items: json['items'].forEach(
        (item) {
          return Item.fromJson(item);
        },
      ).toList<Item>(),
    );
  }

  List<Item> _iitems = List.empty(growable: true);
  String _paymentOption = "";
  String get paymentOption => this._paymentOption;

  set paymentOption(String value) => this._paymentOption = value;

  int getlength() {
    return _iitems.length;
  }

  get iitems => this._iitems;

  set iitems(value) => this._iitems = value;

  void removeProduct(Product p) {
    if (_iitems.isEmpty) {
      return;
    } else {
      for (int i = 0; i < _iitems.length; i++) {
        if (_iitems[i]._productId == p.id) {
          if (_iitems[i]._quantity == 1) {
            //if the quantity of the product is one
            _iitems.removeAt(i);
            break;
          } else {
            _iitems[i]._quantity -= 1;
            break;
          }
        }
      }
    }
  }

  void addProduct(Product p) {
    //dev.debugger();
    bool flag = false;
    if (_iitems.isEmpty) {
      _iitems.add(Item(product: p, quantity: 1, productId: p.id));
      return;
    } else {
      for (int i = 0; i < _iitems.length; i++) {
        if (_iitems[i]._productId == p.id) {
          _iitems[i]._quantity += 1;
          flag = true;
          break;
        }
      }
      if (!flag) {
        _iitems.add(Item(product: p, quantity: 1, productId: p.id));
      }
    }
  }

  double geTotalPrice() {
    double price = 0.0;
    for (int i = 0; i < _iitems.length; i++) {
      price += _iitems[i].getProductPriceByQuantity();
    }
    return price;
  }

  Map toJson() => {
        'paymentOption': _paymentOption,
        'items': this._iitems.map((element) {
          return element.toJson();
        }).toList(),
      };
}

class Item {
  Item({
    id = "",
    productId = "",
    quantity = 0,
    status = "",
    product,
  }) {
    this._iid = id;
    this._productId = productId;
    this.product = product;
    this._quantity = quantity;
    this._status = status;
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'] as String,
      productId: json['productId'] == null ? "" : json['productId'] as String,
      quantity: json['quantity'] == null ? 0 : json['quantity'] as int,
      status: json['status'] == null ? "" : json['status'] as String,
      product: json['product'] == null
          ? Product()
          : Product.fromJson(json['product']),
    );
  }

  Product product = Product();

  String _iid = "";
  String _productId = "";
  int _quantity = 0;
  String _status = "";

  double getProductPriceByQuantity() {
    return product.unitPrice * quantity;
  }

  get iid => this._iid;

  set iid(value) => this._iid = value;

  get productId => this._productId;

  set productId(value) => this._productId = value;

  get quantity => this._quantity;

  set quantity(value) => this._quantity = value;

  get status => this._status;

  set status(value) => this._status = value;

  Map toJson() => {
        'productId': this._productId,
        'quantity': this._quantity,
        'product': this.product.toJson(),
      };
}
