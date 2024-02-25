import 'package:biletymascow/history_util.dart';
import 'package:flutter/material.dart';

class SearchButton extends StatefulWidget {
  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HistoryUtil.saveSearchHistory();
      },
      child: Container(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Поиск'),
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
        ),
      ),
    );
  }
}
