import 'package:flutter/material.dart';
import 'package:groceryshop/shared/constants.dart';

class ShopByCategoryScreen extends StatelessWidget {
  String categoryType;

  ShopByCategoryScreen({this.categoryType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(categoryType, style: boldHeadingStyle,),),
    );
  }
}

