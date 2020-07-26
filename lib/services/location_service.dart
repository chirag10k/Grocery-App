import 'dart:async';
import 'package:groceryshop/models/user_location_model.dart';
import 'package:location/location.dart';

class LocationService {
  //Keeps track of current location of user
  UserLocation _currentLocation;
  Location  location = Location();

  //Continuously emit location updates
  StreamController<UserLocation> _locationController = StreamController<UserLocation>.broadcast();

  LocationService() {
    location.requestPermission().then((granted) {
      if(granted != null){
        location.onLocationChanged.listen((locationData) {
          if(locationData != null){
            _locationController.add(UserLocation(latitude:  locationData.latitude, longitude: locationData.longitude));
          }
        });
      }
    });
  }

  Stream<UserLocation> get locationStream => _locationController.stream;

  Future<UserLocation> getLocation() async {
    try{
      var userLocation = await location.getLocation();
      _currentLocation = UserLocation(
        latitude: userLocation.latitude,
        longitude: userLocation.longitude,
      );
    } catch(e) {
      print('Could not get the location: $e');
    }
    return _currentLocation;
  }

}