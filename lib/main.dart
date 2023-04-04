import 'package:flutter/material.dart';

void main() {
  runApp(const FirebaseApp());
}

class FirebaseApp extends StatelessWidget {
  const FirebaseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Flutter with Firebase",
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
      ),
      body: const Center(
        child: Text("New app"),
      ),
    );
  }
}


