import 'package:flutter/material.dart';

class MyHistoryScreen extends StatefulWidget {
  @override
  _MyHistoryScreenState createState() => _MyHistoryScreenState();
}

class _MyHistoryScreenState extends State<MyHistoryScreen> {
  List<bool> isExpandedList = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Наши направления',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  Text('Смотрет все',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.red[900],
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            buildDirectionRow(0, 'Алматы - Уфа', '8 970 ₽'),
            SizedBox(height: 10.0),
            Divider(height: 10.0),
            buildDirectionRow(1, 'Алматы - Томск', '11345 ₽'),
            SizedBox(height: 10.0),
            Divider(height: 10.0),
            buildDirectionRow(2, 'Алматы - Казань', '13 900 ₽'),
          ],
        ),
      ),
    );
  }

  Widget buildDirectionRow(int index, String title, String price) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18.0),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpandedList[index] = !isExpandedList[index];
                });
              },
              child: Icon(isExpandedList[index]
                  ? Icons.arrow_downward
                  : Icons.arrow_upward),
            ),
          ],
        ),
        if (isExpandedList[index]) buildExpandedContainer(price),
      ],
    );
  }

  Widget buildExpandedContainer(String price) {
    return Container(
      padding: EdgeInsets.all(8.0),
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Детали'),
          Text(
            '$price >',
            style: TextStyle(color: Colors.red, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
