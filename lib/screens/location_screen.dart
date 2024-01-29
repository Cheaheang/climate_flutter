import 'package:climate/screens/city_screen.dart';
import 'package:climate/services/weather.dart';
import 'package:climate/utilities/constants.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.weather});
  final weather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.weather);
  }

  int? weatherCondition;
  String? city;
  double? weatherTemparature;
  int? temp;
  String? weatherIcon;
  String? weatherText;
  void updateUI(dynamic weatherData) {
    setState(
      () {
        if(weatherData == 'null'){
            weatherText='error no data we can get';
            weatherTemparature = 00;
            return;
        }  
        weatherCondition = weatherData['weather'][0]['id']; 
        WeatherModel model = WeatherModel();
        weatherIcon = model.getWeatherIcon(weatherCondition!); 
        city = weatherData['name']; 
        weatherTemparature = weatherData['main']['temp'];
        temp = weatherTemparature?.toInt();
        weatherText = model.getMessage(temp!); 
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:NetworkImage('https://i.pinimg.com/474x/08/86/1e/08861e9e8de2b9e6afbec17d1181b477.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weather.getCurrentLocation();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 30.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        Navigator.push(
                          context,MaterialPageRoute(
                            builder: (context) {
                              return CityScreen();
                            },
                          )                          
                        );
                      });
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temp°c',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weatherText in $city",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
