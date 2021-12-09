import 'package:blaze_pos_api_flutter_app/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeaturedProducts extends StatefulWidget {
  const FeaturedProducts({Key? key}) : super(key: key);

  @override
  _FeaturedProductsState createState() => _FeaturedProductsState();
}

class _FeaturedProductsState extends State<FeaturedProducts> {
  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<List<Product>>(context);
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Featured',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'View All',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemBuilder: (ctx, i) {
                return Card(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: MediaQuery.of(context).size.height * 0.18,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(products[i].assetpublicURL),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        products[i].name.toString().length >= 15
                            ? products[i].name.toString().replaceRange(
                                15, products[i].name.toString().length, '...')
                            : products[i].name,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                );
              },
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
