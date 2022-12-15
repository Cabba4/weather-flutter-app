import 'package:flutter/material.dart';
import 'package:my_weather_app/custom_icons_icons.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Make widget here (main screen)
// stateless or stateful widgets

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String cityName = "Tampere";
  String weatherDiscrition = "sunny";
  double temperature = 0;
  double wind = 0;

  void updateWeather() {
    setState(() {
      cityName = "Helsinki";
      weatherDiscrition = "Rainy";
      temperature = 10;
      wind = 5;
    });
  }

  void fetchWeather() async {
    // weather from OPENWEATHErMAP
    Uri uri = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=tampere&units=metric&appid=c75051189dd4fe9cef3fc5cec64b98a9');

    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var weatherData = json.decode(response.body);
      setState(() {
        cityName = weatherData['name'];
        temperature = weatherData['main']['temp'];
        weatherDiscrition = weatherData['weather'][0]['description'];
        wind = weatherData['wind']['speed'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Weather App")),
      body: Center(
        child: Column(
          children: [
            Text("$cityName", style: const TextStyle(fontSize: 40)),
            Text("$weatherDiscrition", style: const TextStyle(fontSize: 40)),
            Text("-$temperature C", style: const TextStyle(fontSize: 40)),
            Text("$wind m/s", style: const TextStyle(fontSize: 40)),
            Icon(CustomIcons.cloud_sun),
            ElevatedButton(
              onPressed: () {
                fetchWeather();
              },
              child: Text(
                "Update Weather",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                openForecast();
              },
              child: Text(
                "Open Forecast",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                openAccelerometer();
              },
              child: Text(
                "Open accelerometer",
              ),
            ),
          ],
        ),
      ),
    );
  }

  void openForecast() {
    Navigator.pushNamed(context, '/forecast');
  }

  void openAccelerometer() {
    Navigator.pushNamed(context, '/accelerometer');
  }
}
