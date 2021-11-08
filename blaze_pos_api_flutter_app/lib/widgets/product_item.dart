import 'package:blaze_pos_api_flutter_app/models/Product.dart';
import 'package:blaze_pos_api_flutter_app/providers/cart_provider.dart';
import 'package:blaze_pos_api_flutter_app/screens/ProductDetailScreen.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  ProductItem(Product p, Function i) {
    _product = p;
    _updateCartCount = i;
  }

  late Product _product;
  Function _updateCartCount = () {};

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetailScreen(
                  widget._product, widget._updateCartCount)),
        );
      },
      child: Card(
        elevation: 4,
        child: Container(
          height: 300,
          width: 200,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    child: widget._product.assetId == null
                        ? Image.network(
                            'https://static.thenounproject.com/png/944120-200.png')
                        : Hero(
                            tag: widget._product.id,
                            child:
                                Image.network(widget._product.assetpublicURL)),
                    height: 150,
                    width: 200,
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      height: 40,
                      width: 40,
                      child: IconButton(
                          onPressed: () {
                            widget._updateCartCount();
                            setState(() {
                              CartProvider.addProductToCart(widget._product);
                            });
                          },
                          icon: Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.blue,
                          )),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7),
                width: 200,
                child: Text(
                  widget._product.flowerType,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                width: 200,
                child: Text(
                  widget._product.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.grey[800]),
                  maxLines: 2,
                  softWrap: true,
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                width: 200,
                child: Text(
                  'THC ${widget._product.thc}% \nCBD ${widget._product.cbd}%',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  softWrap: true,
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                width: 200,
                child: Text(
                  '\$${widget._product.unitPrice.toString()}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.blue),
                  softWrap: true,
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
