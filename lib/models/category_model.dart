import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groceryshop/enums/category_type.dart';
import 'package:groceryshop/screens/home/specific_category_screen.dart';

class Category {
  IconData iconData;
  MaterialPageRoute route;
  String title;

  Category({this.iconData, this.route, this.title});
}

List<Category> categoryList = [
  Category(
    iconData: FontAwesomeIcons.icons,
    route: MaterialPageRoute(builder: (_)=> ShopByCategoryScreen(categoryType: 'Fruits',),),
    title: 'Fruits',
  ),
  Category(
    iconData: FontAwesomeIcons.glassMartiniAlt,
    route: MaterialPageRoute(builder: (_)=> ShopByCategoryScreen(categoryType: 'Juices',),),
    title: 'Juices',
  ),
  Category(
    iconData: FontAwesomeIcons.icons,
    route: MaterialPageRoute(builder: (_)=> ShopByCategoryScreen(categoryType: 'Grains',),),
    title: 'Grains',
  ),
  Category(
    iconData: FontAwesomeIcons.icons,
    route: MaterialPageRoute(builder: (_)=> ShopByCategoryScreen(categoryType: 'Meat',),),
    title: 'Meat',
  ),
  Category(
    iconData: FontAwesomeIcons.icons,
    route: MaterialPageRoute(builder: (_)=> ShopByCategoryScreen(categoryType: 'Bakery',),),
    title: 'Bakery',
  ),
  Category(
    iconData: FontAwesomeIcons.icons,
    route: MaterialPageRoute(builder: (_)=> ShopByCategoryScreen(categoryType: 'Hygiene',),),
    title: 'Hygiene',
  ),
  Category(
    iconData: FontAwesomeIcons.icons,
    route: MaterialPageRoute(builder: (_)=> ShopByCategoryScreen(categoryType: 'Cleaning',),),
    title: 'Cleaning',
  ),
];