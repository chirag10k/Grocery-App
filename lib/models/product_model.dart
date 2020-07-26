import 'package:groceryshop/enums/category_type.dart';
import 'package:groceryshop/enums/product_quantity.dart';

class Product {
  String title;
  String imageAddress;
  double price;
  String rate;
  int quantity;
  String category;

  Product({this.title, this.imageAddress, this.price, this.rate, this.quantity, this.category});
}

List<Product> topProductList = [
  Product(
    title: 'Banana',
    imageAddress: 'assets/images/banana.png',
    price: 100,
    rate: Quantity.dozen.toString(),
    quantity: 0,
    category: CategoryType.Fruits.toString(),
  ),
  Product(
    title: 'Apple',
    imageAddress: 'assets/images/apple.png',
    price: 100,
    rate: Quantity.kg.toString(),
    quantity: 0,
    category: CategoryType.Fruits.toString(),
  ),
  Product(
    title: 'Pomegranate',
    imageAddress: 'assets/images/pomegranate.png',
    price: 100,
    rate: Quantity.kg.toString(),
    quantity: 0,
    category: CategoryType.Fruits.toString(),
  ),
  Product(
    title: 'Litchi',
    imageAddress: 'assets/images/apple.png',
    price: 100,
    rate: Quantity.dozen.toString(),
    quantity: 0,
    category: CategoryType.Fruits.toString(),
  ),
  Product(
    title: 'Cherry',
    imageAddress: 'assets/images/apple.png',
    price: 100,
    rate: Quantity.dozen.toString(),
    quantity: 0,
    category: CategoryType.Fruits.toString(),
  ),
  Product(
    title: 'Fish',
    imageAddress: 'assets/images/apple.png',
    price: 100,
    rate: Quantity.Pc.toString(),
    quantity: 0,
    category: CategoryType.Meat.toString(),
  ),
  Product(
    title: 'Watermelon',
    imageAddress: 'assets/images/apple.png',
    price: 100,
    rate: Quantity.kg.toString(),
    quantity: 0,
    category: CategoryType.Fruits.toString(),
  ),
  Product(
    title: 'Dettol Hand Sanitizer',
    imageAddress: 'assets/images/apple.png',
    price: 100,
    rate: Quantity.Pc.toString(),
    quantity: 0,
  ),
  Product(
    title: 'Strawberry',
    imageAddress: 'assets/images/apple.png',
    price: 100,
    rate: Quantity.gm.toString(),
    quantity: 0,
  ),
  Product(
    title: 'Good Day Biscuits',
    imageAddress: 'assets/images/apple.png',
    price: 100,
    rate: Quantity.Pc.toString(),
    quantity: 0,
  ),
  Product(
    title: 'Oreo Biscuits',
    imageAddress: 'assets/images/apple.png',
    price: 100,
    rate: Quantity.Pc.toString(),
    quantity: 0,
  ),
  Product(
    title: 'Kiwi',
    imageAddress: 'assets/images/kiwi.jpg',
    price: 100,
    rate: Quantity.Pc.toString(),
    quantity: 0,
  ),
];

List<Product> favProductsList = [];

List<Product> cartList = [];