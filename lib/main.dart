import 'package:flutter/material.dart';
import 'package:groceryshop/models/user_location_model.dart';
import 'package:groceryshop/services/auth_service.dart';
import 'package:groceryshop/services/connectivity_service.dart';
import 'package:groceryshop/services/location_service.dart';
import 'package:groceryshop/wrapper.dart';
import 'package:provider/provider.dart';
import 'enums/connectivity_status.dart';
import 'models/user_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
//        StreamProvider<User>.value(
//          value: AuthService().onAuthStateChanged,
//        ),
        StreamProvider<ConnectivityStatus>.value(
          value: ConnectivityService().onConnectivityChanged,
        ),
        StreamProvider<UserLocation>.value(
          value: LocationService().locationStream,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
