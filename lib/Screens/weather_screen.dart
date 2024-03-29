import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Position? position;
  late double latitude;
  late double longitude;
  late double temperature;
  late String cityName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 위치 정보를 가져옵시다.

    latitude = 0;
    longitude = 0;
    temperature = 0;
    cityName = '';

    print('getPosition 전입니다. ');
    getPosition();

    print('getPosition 후입니다. ');
    print('latitude : $latitude');
    print('longitude : $longitude');
  }

  Future<void> getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    print('isLocationServiceEnabled 전입니다. ');
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    print('checkPermission 전입니다. ');
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    print('getCurrentPosition 전입니다. ');

    position = await Geolocator.getCurrentPosition();
    setState(() {
      // When we reach here, permissions are granted and we can
      // continue accessing the position of the device.

      latitude = position!.latitude;
      longitude = position!.longitude;

      getWeather(latitude.toString(), longitude.toString());
    });

    //날씨


    print(position);
    print('latitude : $latitude');
    print('longitude : $longitude');
  }

  void getWeather(@required String lat,@required String lon) async {

    final dio = Dio();
    String apiKey = dotenv.get("WEATHER_KEY");
    String str = 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey';
    Response response;
    response = await dio.get(str);
    print(response.data.toString());

    var weatherData = jsonDecode(response.toString());

    double temp = weatherData['main']['temp'];
    String name = weatherData['name'];

    setState(() {
      temperature = temp - 273.15;
      cityName = name;
    });

    print(temp.toString());
    print(name);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'lon : $longitude',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'lat : $latitude',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'TEMP : ${temperature.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 32),
            ),
            Text(
              'CITY : $cityName',
              style: const TextStyle(fontSize: 32),
            ),
          ],
        ),
      ),
    );
  }
}
