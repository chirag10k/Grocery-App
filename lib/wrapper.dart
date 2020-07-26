import 'package:flutter/material.dart';
import 'package:groceryshop/enums/connectivity_status.dart';
import 'package:groceryshop/screens/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'screens/offline_screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final connectionStatus = Provider.of<ConnectivityStatus>(context);
    //return either Home or Authenticate Screen
    if(connectionStatus == ConnectivityStatus.Offline)
      return OfflineScreen();
    else
      return HomeScreen();


  }
}
