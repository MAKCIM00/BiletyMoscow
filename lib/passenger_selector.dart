import 'package:flutter/material.dart';

class PassengerSelector extends StatefulWidget {
  @override
  _PassengerSelectorState createState() => _PassengerSelectorState();
}

class _PassengerSelectorState extends State<PassengerSelector> {
  int selectedPassengers = 1;

  Future<void> _selectPassengers(BuildContext context) async {
    int? result = await showDialog<int>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(
            'Выберите число пассажиров',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: NumberPicker(
            value: selectedPassengers,
            minValue: 1,
            maxValue: 10,
            onChanged: (value) {
              setState(() {
                selectedPassengers = value;
              });
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(selectedPassengers);
              },
              child: Text('Готово'),
            ),
          ],
        );
      },
    );

    if (result != null) {
      setState(() {
        selectedPassengers = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.red[900],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Icon(Icons.people),
              SizedBox(width: 8),
              Text(
                'Число пассажиров',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '$selectedPassengers чел.',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 16),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _selectPassengers(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NumberPicker extends StatelessWidget {
  final int value;
  final int minValue;
  final int maxValue;
  final ValueChanged<int>? onChanged;

  NumberPicker({
    required this.value,
    required this.minValue,
    required this.maxValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            if (value > minValue) {
              onChanged?.call(value - 1);
            }
          },
        ),
        Text(
          '$value',
          style: TextStyle(fontSize: 18),
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            if (value < maxValue) {
              onChanged?.call(value + 1);
            }
          },
        ),
      ],
    );
  }
}
