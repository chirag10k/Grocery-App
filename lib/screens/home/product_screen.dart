import 'package:flutter/material.dart';
import 'package:groceryshop/models/product_model.dart';
import 'package:groceryshop/screens/home/cart_screen.dart';
import 'package:groceryshop/shared/constants.dart';

class ProductScreen extends StatefulWidget {

  Product product;
  var list;

  ProductScreen({this.product, this.list});

  @override
  _ProductScreenState createState() => _ProductScreenState(product: product);
}

class _ProductScreenState extends State<ProductScreen> {

  Product product;
  double width;
  double height;
  bool isExpanded = false;
  Product addedProduct;

  Color pageThemeColor;
  _ProductScreenState({this.product});

  @override
  Widget build(BuildContext context) {
    pageThemeColor = colorsList[widget.list.indexOf(product)];
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    addedProduct = product;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: pageThemeColor,
      ),
      height:  height/1.5,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: (widget.list == favProductsList) ? 40 : 0,
            left: 20,
            right: 20,
            child: Container(
              height: 75,
              width: width,
              child: Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.arrow_back, color: Colors.white,), onPressed: () => Navigator.pop(context)),
                  Spacer(),
                  Material(
                    borderRadius: BorderRadius.circular(15),
                    child: IconButton(
                      icon: Icon(Icons.shopping_basket),
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => CartScreen())
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 80,
            child: Container(
              child: Image.asset(product.imageAddress, height: 150, width: 300, ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              height: (widget.list == favProductsList) ? height / 3 : height / 2.5,
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          product.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 32,
                          ),
                        ),
                      ),
                      (addedProduct.quantity >= 1)
                          ? Row(
                        children: <Widget>[
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.yellow,
                            ),
                            child: IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: (){
                                setState(() {
                                  addedProduct.quantity = addedProduct.quantity - 1;
                                  cartList.removeWhere((element) => element.title == addedProduct.title);
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 40,
                            alignment: Alignment.center,
                            child: Text(addedProduct.quantity.toString(), style: TextStyle(fontSize: 18),),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.yellow,
                            ),
                            child: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: (){
                                setState(() {
                                  addedProduct.quantity = addedProduct.quantity + 1;
                                  cartList.removeWhere((element) => element.title == addedProduct.title);
                                  cartList.add(addedProduct);
                                });
                              },
                            ),
                          ),
                        ],
                      )
                          : MaterialButton(
                        onPressed: () {
                          setState(() {
                            addedProduct.quantity = addedProduct.quantity + 1;
                            cartList.add(addedProduct);
                          });
                        },
                        color: pageThemeColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
                        ),
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  RichText(
                    text: TextSpan(
                      text: '₹${product.price.toString()}',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '/ ${product.rate.substring(9)}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      isExpanded
                          ? InkWell(
                        child: const Text('See Less', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                        onTap: () =>
                            setState(() => isExpanded = ! isExpanded),
                      )
                          : InkWell(
                        child: const Text('See More...', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                        onTap: () =>
                            setState(() => isExpanded = ! isExpanded),
                      ),
                      ConstrainedBox(
                        constraints: isExpanded
                            ? BoxConstraints()
                            : BoxConstraints(maxHeight: 50.0),
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an "
                              "unknown printer took a galley of type and scrambled it to make a type specimen book. "
                              "It has survived not only five centuries, but also the leap into electronic typesetting, "
                              "remaining essentially unchanged. It was popularised in the 1960s with the release of "
                              "Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing "
                              "software like Aldus PageMaker including versions of Lorem Ipsum.",
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
