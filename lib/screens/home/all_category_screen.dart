import 'package:flutter/material.dart';
import 'package:groceryshop/common/category_widget.dart';
import 'package:groceryshop/models/category_model.dart';
import 'package:groceryshop/shared/constants.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    icon: Icon(Icons.arrow_back, size: 20,),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    'Shop by ',
                    style: normalHeadingStyle.copyWith(fontSize: 18),
                  ),
                  Text(
                    "Category",
                    style: boldHeadingStyle.copyWith(fontSize: 20),
                  ),
                ],
              ),
            ),
            CategoryWidget(categoryList),
          ],
        )
      ),
    );
  }
}
