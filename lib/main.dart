import 'package:flutter/material.dart';
import 'views/home_screen.dart';

void main() {
  runApp(const MarsRoverApp());
}

class MarsRoverApp extends StatelessWidget {
  const MarsRoverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mars Rover Photos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
