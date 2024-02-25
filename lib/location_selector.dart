import 'package:flutter/material.dart';

class LocationSelector extends StatefulWidget {
  @override
  _LocationSelectorState createState() => _LocationSelectorState();
}

class _LocationSelectorState extends State<LocationSelector>
    with SingleTickerProviderStateMixin {
  bool isSwapped = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  final List<String> locations = [
    'Ташкент',
    'Баку',
    'Алматы',
    'Уфа',
    'Томск',
    'Казань'
  ];
  String selectedLocation1 = 'Ташкент';
  String selectedLocation2 = 'Баку';

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  void swapLocations() {
    setState(() {
      isSwapped = !isSwapped;
      if (isSwapped) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  void showLocationOptions(BuildContext context, bool isFirstLocation) async {
    String? selected = await showModalBottomSheet<String>(
      context: context,
      builder: (BuildContext context) {
        return ListView(
          children: locations
              .map((location) => ListTile(
                    title: Text(location),
                    onTap: () {
                      Navigator.pop(context, location);
                    },
                  ))
              .toList(),
        );
      },
    );

    if (selected != null) {
      setState(() {
        if (isFirstLocation) {
          selectedLocation1 = selected;
        } else {
          selectedLocation2 = selected;
        }
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.red[900],
        height: 62,
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (BuildContext context, Widget? child) {
                double airplanePosition = isSwapped ? 0 : 1 - _animation.value;
                return Positioned(
                  left: MediaQuery.of(context).size.width * airplanePosition,
                  child: Icon(
                    Icons.airplane_ticket_outlined,
                    color: Colors.blueAccent[400],
                  ),
                );
              },
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: swapLocations,
                  child: Icon(
                    Icons.swap_vert,
                    color: Colors.blueAccent[400],
                  ),
                ),
                VerticalDivider(color: Colors.white),
                InkWell(
                  onTap: () => showLocationOptions(context, true),
                  child: Text(
                    selectedLocation1,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                Icon(Icons.location_searching, color: Colors.white),
                Expanded(child: Divider(color: Colors.white)),
                Icon(Icons.location_on, color: Colors.white),
                VerticalDivider(
                  color: Colors.white,
                ),
                InkWell(
                  onTap: () => showLocationOptions(context, false),
                  child: Text(
                    selectedLocation2,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ),
                SizedBox(width: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
