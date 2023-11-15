import 'package:flutter/material.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 위치 정보를 가져옵시다.

    latitude = 0;
    longitude = 0;

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
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    position = await Geolocator.getCurrentPosition();

    latitude = position!.latitude;
    longitude = position!.longitude;


    print(position);
    print('latitude : $latitude');
    print('longitude : $longitude');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Screen'),
      ),
      body: Placeholder(),
    );
  }


}
