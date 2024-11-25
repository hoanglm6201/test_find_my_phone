import 'package:flutter/material.dart';
import 'package:infinite_listview/infinite_listview.dart';

Widget customListSound(){
  final List<String> items = ['A', 'B', 'C', 'D', 'E'];
  int selectedIndex = 0;
  return InfiniteListView.builder(
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      final item = items[index % items.length];
      final isSelected = (index % items.length) == selectedIndex;

      return GestureDetector(
        onTap: () {
          selectedIndex = index % items.length;
        },
        child: Container(
          width: 100,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            item,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: isSelected ? 24 : 18,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      );
    },
  );
}