import 'dart:convert';
import 'package:climate/services/weather.dart';
import 'package:climate/utilities/constants.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
   @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  WeatherModel weatherModel = WeatherModel();
  final locationName = TextEditingController();
  int? condition;
  String? city;
  double? weatherTemparature;
  int? temp;

  void cityWeather({String? cityName,dynamic weatherData})async{
      // WeatherModel weatherModel = WeatherModel();
      // weatherModel.getCurrentLocation(city:cityName );
      condition = weatherData['weather'][0]['id']; 
      city = weatherData['name'];
      weatherTemparature = weatherData['main']['temp'];
      temp = weatherTemparature?.toInt();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://i.pinimg.com/564x/e0/8b/cf/e08bcf250e3d01e1416904911ff07f03.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: null,
              ),
              TextField(
                  controller: locationName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Location',
                  )),
              TextButton(
                onPressed: () {
                  
                },
                child: TextButton(
                  onPressed: () async{
                    var weather = await weatherModel.getCurrentLocation();
                    String city = locationName.text;
                      cityWeather(cityName: city,weatherData: weather);
          //             showDialog(
          //   context: context,
          //   builder: (context) {
          //     return AlertDialog(
          //       // Retrieve the text the that user has entered by using the
          //       // TextEditingController.
          //       content: Text(locationName.text),
          //     );
          //   },
          // );
                  },
                  child: Text(
                    'Get Weather',
                    style: kButtonTextStyle,
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    '$condition',
                    style: kButtonTextStyle,
                  ),
                  Text(
                    '$city',
                    style: kButtonTextStyle,
                  )

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
