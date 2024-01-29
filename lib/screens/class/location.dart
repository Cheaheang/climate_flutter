
import 'package:geolocator/geolocator.dart';
 class Location{
  double? longitude  ;
  double? latitude  ;
Future<void> getLocation()async{
 
    // LocationPermission permission = await Geolocator.checkPermission();
    // print(permission);
    try{

     LocationPermission permission = await Geolocator.requestPermission();
     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    longitude = position.longitude;
    latitude = position.latitude;

    }catch(e){
      print(e);
    }

  
 }
}