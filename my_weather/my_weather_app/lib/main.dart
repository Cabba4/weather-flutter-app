import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:my_weather_app/Screens/forecast_screen.dart';
import 'package:my_weather_app/Screens/main_screen.dart';
import 'package:my_weather_app/custom_icons_icons.dart';
import 'package:my_weather_app/Screens/accelerometer_screen.dart';

void main() {
  runApp(MaterialApp(title: "Weather App", initialRoute: "/", routes: {
    '/': (context) => const WeatherScreen(),
    '/forecast': (context) => const ForecastScreen(),
    '/accelerometer': (context) => const Accelerometer(),
  }));
}

// Make widget here (main screen)
// stateless or stateful widgets

