import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class Accelerometer extends StatefulWidget {
  const Accelerometer({Key? key}) : super(key: key);
  @override
  State<Accelerometer> createState() => _AccelerometerState();
}

double xSensorValue = 0, ySensorValue = 0, zSensorValue = 0.0;
double latVal = 0, longVal = 0;

class _AccelerometerState extends State<Accelerometer> {
  @override
  void initState() {
    // we do this at the first load of
    super.initState();
    sensorValues();
    // ask for location permission
  }

  void sensorValues() {
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        xSensorValue = event.x;
        ySensorValue = event.y;
        zSensorValue = event.z;
      });
      //print(event);
    });
  }

  void locationValue() async {
    if (await Permission.location.request().isGranted) {
      Location location = new Location();
      location.onLocationChanged.listen((LocationData currentLocation) {
        latVal = currentLocation.latitude!;
        longVal = currentLocation.longitude!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Accelerometer sensor")),
      body: Center(
        child: Column(
          children: [
            Text("Values: $xSensorValue , $ySensorValue , $zSensorValue",
                style: const TextStyle(fontSize: 40)),
            ElevatedButton(
              onPressed: () {
                sensorValues();
              },
              child: Text(
                "Get Accelerometer values",
              ),
            ),
            Text("Lat: $latVal Long: $longVal ",
                style: const TextStyle(fontSize: 40)),
            ElevatedButton(
              onPressed: () {
                locationValue();
              },
              child: Text(
                "Get Location values",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
