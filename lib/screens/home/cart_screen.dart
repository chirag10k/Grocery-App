import 'package:flutter/material.dart';
import 'package:groceryshop/models/product_model.dart';
import 'package:groceryshop/shared/constants.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  double height;
  double width;
  bool isExpanded = false;
  Product addedProduct;

  Color cardThemeColor;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: <Widget>[
              Container(
                height: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back,),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Text(
                      'Cart',
                      style: normalHeadingStyle,
                    ),
                  ],
                ),
              ),
              (cartList.length > 0)
                  ? ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: cartList.length,
                    itemBuilder: (context, index) {
                      addedProduct = cartList[index];
                      cardThemeColor = colorsList[cartList.indexOf(cartList[index])];
                      return Container(
                        height: 150,
                        width: width,
                        margin: EdgeInsets.symmetric(vertical: 1),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          color: cardThemeColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(cartList[index].imageAddress),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              flex: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          cartList[index].title,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 25,
                                          ),
                                        ),
                                      ),
                                      Row(
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
                                                  cartList[index].quantity--;
                                                  print(cartList[index].quantity);
                                                  if(cartList[index].quantity == 0) {
                                                    cartList.removeAt(index);
                                                  }
                                                });
                                              },
                                            ),
                                          ),
                                          Container(
                                            width: 40,
                                            alignment: Alignment.center,
                                            child: Text(cartList[index].quantity.toString(), style: TextStyle(fontSize: 18),),
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
                                                  cartList[index].quantity++;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  RichText(
                                    text: TextSpan(
                                      text: '₹${cartList[index].price.toString()}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: '/ ${cartList[index].rate.substring(9)}',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.play_circle_filled),
                  SizedBox(width: 20,),
                  Text('No Items saved yet!', style: boldHeadingStyle,),
                ],
              ),
            ],
          )
      ),
    );
  }
}
