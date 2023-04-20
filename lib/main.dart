import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const FirebaseApp());
}

class FirebaseApp extends StatelessWidget {
  const FirebaseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Flutter with Firebase",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Application"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MyLocationScreen()));
            },
            icon: const Icon(Icons.location_on)
          )
        ],
      ),
      body: const Center(
        child: Text("New app"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const MapViewScreen()));
        },
        child: const Icon(Icons.map),
      ),
    );
  }
}

class MapViewScreen extends StatelessWidget {
  const MapViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Map View"),),
    );
  }
}

class MyLocationScreen extends StatefulWidget {
  const MyLocationScreen({Key? key}) : super(key: key);

  @override
  State<MyLocationScreen> createState() => _MyLocationScreenState();
}

class _MyLocationScreenState extends State<MyLocationScreen> {

  Position? currentLocation;

  void getCurrentLocation() {
    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high
      )
    ).listen((event) {
      print(event);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Location"),),
      body: Center(
        child: Text(currentLocation.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          LocationPermission permission = await Geolocator.requestPermission();
          if(permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
            currentLocation = await Geolocator.getCurrentPosition();
            setState(() {});
          } else {
            print("Permission Denied");
          }
        },
        child: const Icon(Icons.find_in_page_outlined),
      ),
    );
  }
}




