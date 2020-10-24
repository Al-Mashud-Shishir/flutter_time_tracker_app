import 'package:flutter/material.dart';
import 'package:flutter_time_tracker_app/src/screens/landing_screen.dart';

class app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Time Tracker",
      theme: ThemeData(
        primaryColor: Colors.indigo,
      ),
      home: LandingScreen(),
    );
  }
}
