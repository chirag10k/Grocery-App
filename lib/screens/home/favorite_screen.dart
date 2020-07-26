import 'package:flutter/material.dart';
import 'package:groceryshop/common/product_tile_widget.dart';
import 'package:groceryshop/models/product_model.dart';
import 'package:groceryshop/screens/home/product_screen.dart';
import 'package:groceryshop/shared/constants.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
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
                      icon: Icon(Icons.arrow_back,),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Text(
                      'Saved Items',
                      style: normalHeadingStyle,
                    ),
                  ],
                ),
              ),
              (favProductsList.length > 0)
                  ? GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: favProductsList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context)=> Scaffold(body: ProductScreen(product: favProductsList[index], list: favProductsList,)),
                        ),),
                        child: ProductTile(product: favProductsList[index]),
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
