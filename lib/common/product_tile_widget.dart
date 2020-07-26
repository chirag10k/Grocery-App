import 'package:flutter/material.dart';
import 'package:groceryshop/models/product_model.dart';
import 'dart:math';
import 'package:groceryshop/shared/constants.dart';

class ProductTile extends StatefulWidget {

  Product product;

  ProductTile({this.product});

  @override
  _ProductTileState createState() => _ProductTileState(product: product);
}

class _ProductTileState extends State<ProductTile> {
  Product product;
  Product addedProduct;
  var random = Random();
  var width ;

  _ProductTileState({this.product});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: colorsList[topProductList.indexOf(product)],
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),),
                  color: Colors.blue[50].withOpacity(0.4,)
              ),
              child: IconButton(
                icon: (favProductsList.contains(product)) ? Icon(Icons.favorite): Icon(Icons.favorite_border),
                color: (favProductsList.contains(product)) ? Colors.red: Colors.black,
                onPressed: () {
                  setState(() {
                    if(favProductsList.contains(product))
                      favProductsList.remove(product);
                    else
                      favProductsList.add(product);
                  });
                },
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    product.imageAddress,
                    height: 80,
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  product.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  '₹${product.price.toString()}/ ${product.rate.substring(9)}',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}