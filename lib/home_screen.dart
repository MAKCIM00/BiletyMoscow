import 'package:biletymascow/buttom_navigator.dart';
import 'package:biletymascow/date_selector.dart';
import 'package:biletymascow/location_selector.dart';
import 'package:biletymascow/my_history_screen.dart';

import 'package:biletymascow/passenger_selector.dart';
import 'package:biletymascow/serach_button.dart';
import 'package:biletymascow/top_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TopBar(),
            LocationSelector(),
            DateSelector(),
            PassengerSelector(),
            SearchButton(),
            MyHistoryScreen(),
            ButtomNavigator(),
          ],
        ),
      ),
    );
  }
}
