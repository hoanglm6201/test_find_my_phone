import 'package:flutter/material.dart';
import 'package:test_find_my_phone/data/model/alarm_history_model.dart';
import 'package:test_find_my_phone/view/screens/alarm_history/widgets/history_item.dart';

class HistoryTab extends StatelessWidget {
  final List<AlarmHistoryModel> items;
  const HistoryTab({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index){
        return items.length == index + 1 ? Column(
          children: [
            HistoryItem(history: items[index], isLastItem: true,),
            const SizedBox(height: 100,)
          ],
        ) : HistoryItem(history: items[index]);
      }
    );
  }
}
