import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groceryshop/screens/home/cart_screen.dart';
import 'package:groceryshop/screens/home/favorite_screen.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20),),
            color: Colors.white,
          ),
          child: Row(
            children: <Widget>[
              Icon(Icons.home, color: Colors.green,),
              SizedBox(width: 10,),
              Text("Home")
            ],
          ),
        ),
        IconButton(
          icon: Icon(Icons.favorite_border, color: Colors.white,),
          onPressed: ()=> Navigator.of(context).push(MaterialPageRoute(
            builder: (context)=> FavoriteScreen(),
          )),
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.shoppingBag, color: Colors.white,),
          onPressed: ()=> Navigator.of(context).push(MaterialPageRoute(
            builder: (context)=> CartScreen(),
          )),
        ),
        IconButton(
          icon: Icon(Icons.person, color: Colors.white,),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ],
    );
  }
}
