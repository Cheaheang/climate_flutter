import 'package:climate/screens/class/location.dart';
import 'package:climate/screens/class/networkHelper.dart';
import 'package:climate/screens/location_screen.dart';
import 'package:climate/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? long;
  double? lat;
  var apiKey = 'a9d3f4852b8f49397409f5f5d7f19baf';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // location();

    getApi();

    // getLocation();
  }

  // void location() async {
  //   Location location = Location();
  //   await location.getLocation();
  // long = location.longitude;
  // lat = location.latitude;
  //  location.longitude;
  //   print(location.latitude);
  //   print(location.longitude);
  // }

  void getApi() async {
    var weatherData = await WeatherModel().getCurrentLocation();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            weather: weatherData,
          );
        },
      ),
    );

    // if(response.statusCode == 200){
    // String data = response.body;

    // print(data);
    //  }else{
    //    print( "error");
    //    print(response.statusCode);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitChasingDots(
        color: Colors.white,
      )
          // child: TextButton(
          //   onPressed: () {

          //       getLocation();

          //     //Get the current location
          //   },
          //   child: Text('Get Location'),
          // ),
          ),
    );
  }
}






//  url:
//             'https://api.openweathermap.org/data/3.0/onecall?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey');




//  print(data);
//       var weather = jsonDecode(data)['weather'][0]['description'];
//       print(weather);
//       var city = jsonDecode(data)['name'];
//       print(city);
//       var weatherTemparature = jsonDecode(data)['main']['temp'];
//       print(weatherTemparature);
//       var weatherCondition = jsonDecode(data)['sys']['id'];
//       print (weatherCondition);