import 'package:flutter/material.dart';
import 'package:biletymascow/home_screen.dart';

void main() {
  runApp(FlightTicketApp());
}

class FlightTicketApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
