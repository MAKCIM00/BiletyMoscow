import 'package:flutter/material.dart';

class ButtomNavigator extends StatefulWidget {
  const ButtomNavigator({Key? key}) : super(key: key);

  @override
  State<ButtomNavigator> createState() => _ButtomNavigatorState();
}

class _ButtomNavigatorState extends State<ButtomNavigator> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        bottomNavigationBar: SizedBox(
          child: NavigationBar(
            destinations: [
              NavigationDestination(
                icon: Icon(
                  Icons.search,
                  color: Colors.red,
                ),
                label: 'Поиск',
              ),
              NavigationDestination(
                icon: Icon(Icons.airplane_ticket_rounded),
                label: 'Рейсы',
              ),
              NavigationDestination(
                icon: Icon(Icons.flight),
                label: 'Билеты',
              ),
              NavigationDestination(
                icon: Icon(Icons.person),
                label: 'Профиль',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
