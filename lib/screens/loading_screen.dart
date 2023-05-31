import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState(){
    super.initState();
    getLocation();
  }
  void getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      // Handle the case when the user denies permission
      print('Location permission denied');
    } else if (permission == LocationPermission.deniedForever) {
      // Handle the case when the user denies permission permanently
      print('Location permission permanently denied');
    } else {
      // Permission granted or already granted
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      print(position);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
