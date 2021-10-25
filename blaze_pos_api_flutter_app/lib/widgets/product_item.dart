import 'package:blaze_pos_api_flutter_app/models/Product.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  ProductItem(Product p) {
    _product = p;
  }

  late Product _product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        height: 300, 
        width: 200, 
        child: Column(
          children: [
            Container(
              child: _product.assetId == null ? Image.network('https://static.thenounproject.com/png/944120-200.png') : Image.network(_product.assetpublicURL),
              height: 150,
              width: 200,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 7),
              width: 200,
              child: Text(
                _product.flowerType,
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
                _product.name,
                style: TextStyle( 
                  fontWeight: FontWeight.bold, 
                  fontSize: 22,
                  color: Colors.grey[800]  
                ),
                maxLines: 2,
                softWrap: true,
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
              width: 200,
              child: Text(
                'THC ${_product.thc}% \nCBD ${_product.cbd}%',
                style: TextStyle(  
                  fontSize: 14,
                  color: Colors.grey[600]  
                ),
                softWrap: true,
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              width: 200,
              child: Text(
                '\$${_product.unitPrice.toString()}',
                style: TextStyle( 
                  fontWeight: FontWeight.bold, 
                  fontSize: 18,
                  color: Colors.blue  
                ),
                softWrap: true,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
