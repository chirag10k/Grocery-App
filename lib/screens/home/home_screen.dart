import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:groceryshop/common/navigation_bar_widget.dart';
import 'package:groceryshop/common/product_tile_widget.dart';
import 'package:groceryshop/models/product_model.dart';
import 'package:groceryshop/models/user_location_model.dart';
import 'package:groceryshop/screens/home/all_category_screen.dart';
import 'package:groceryshop/screens/home/offers_screen.dart';
import 'package:groceryshop/screens/home/product_screen.dart';
import 'package:groceryshop/shared/constants.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  final GlobalKey<ScaffoldState> drawerKey = GlobalKey();
  TabController tabController;

  bool showBottomSheet = false;
  double height;
  double width;
  Address first;
  List<Address> addresses;
  String addressLine;

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
//    final user = Provider.of<User>(context);
//    if(user == null)
//      showBottomSheet = true;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    final userLocation = Provider.of<UserLocation>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: drawerKey,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              height: 80,
              alignment: Alignment.center,
              color: Colors.indigo[200],
              child: ListTile(
                title: Text(
                  'Hi Guest!',
                  style: boldHeadingStyle,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: <Widget>[
                   Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Icon(Icons.location_on),
                        ),
                      ],
                    ),
                  Divider(),
                  ListTile(
                    title: Text(
                      'Home',
                      style: normalHeadingStyle.copyWith(fontSize: 24.0),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Shop by Category',
                      style: normalHeadingStyle.copyWith(fontSize: 24.0),
                    ),
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=> CategoryScreen()
                      ));
                    },
                  ),
//                  ListTile(
//                    title: Text(
//                      'Home',
//                      style: normalHeadingStyle.copyWith(fontSize: 24.0),
//                    ),
//                  ),
//                  ListTile(
//                    title: Text(
//                      'Home',
//                      style: normalHeadingStyle.copyWith(fontSize: 24.0),
//                    ),
//                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: backgroundColor,
            height: height,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: ListView(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.menu), onPressed: () => drawerKey.currentState.openDrawer(),),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          final coordinates = new Coordinates(userLocation.latitude, userLocation.longitude);
                          addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
                          first = addresses.first;
                          setState(() => addressLine = first.addressLine);
                        },
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.my_location, color: (addressLine == null) ? Colors.black : Colors.green,),
                            SizedBox(width: 10,),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 220, maxHeight: 20),
                              child: Text(
                                (addressLine != null) ? addressLine : "",
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(15),
                      child: IconButton(
                        icon: Icon(Icons.local_offer),
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => OffersScreen())
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Material(
                  elevation: 1,
                  borderRadius: BorderRadius.circular(30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset('assets/images/Page1link.jpg', fit: BoxFit.fill, width: width,),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: RichText(
                          text: TextSpan(
                            text: 'Top ',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 40,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Picks',
                                style: TextStyle(
                                  fontSize: 38,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: MaterialButton(
                          color: Colors.black.withOpacity(0.5),
                          elevation: 5,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'Shop by Category',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => CategoryScreen())
                        )
                        ),
                      ),
                    ],
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: topProductList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        drawerKey.currentState.showBottomSheet((context) {
                          return ProductScreen(product: topProductList[index], list: topProductList,);
                        });
                      },
                      child: ProductTile(product: topProductList[index]),
                    );
                  },
                ),
                SizedBox(height: 80,),
              ],
            ),
          ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                  color: colorsList[2],
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                height: 70,
                width: width,
                child: NavigationBar(),
              ),
            )
        ],
      ),
    );
  }
}
