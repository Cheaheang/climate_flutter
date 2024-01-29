import 'package:climate/screens/class/location.dart';
import 'package:climate/screens/class/networkHelper.dart';

class WeatherModel {
  double? long;
  double? lat;
  var apiKey = 'a9d3f4852b8f49397409f5f5d7f19baf';
  Future<dynamic> getCurrentLocation({String? city}) async {
    Location location = Location();
    await location.getLocation();
    long = location.longitude;
    lat = location.latitude;
    if(city !=null){
       NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?q=$city&lat=$lat&lon=$long&units=metric&appid=$apiKey');
    var dataAboutCity = await networkHelper.getData();
    return dataAboutCity;
    }else{

    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&units=metric&appid=$apiKey');
    var weatherData = await networkHelper.getData();
    return weatherData;
    }
  }

    

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 times';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
