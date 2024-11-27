import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:test_find_my_phone/data/model/alarm_history_model.dart';

class HistoryItem extends StatelessWidget {
  final AlarmHistoryModel history;
  final bool isLastItem;
  const HistoryItem({super.key, required this.history, this.isLastItem = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4.0, left: 12, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/images/ic_location.svg', width: 24, height: 24, colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
                  const SizedBox(width: 8,),
                  Text(history.location, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(DateFormat('HH:mm:ss').format(history.time), style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 14, fontWeight: FontWeight.bold),),
                  Text(DateFormat('dd/MM/yyyy').format(history.time), style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),),
                ],
              )
            ],
          ),
        ),
        if(!isLastItem) Divider(color: Colors.white.withOpacity(0.1), thickness: 1.5,)
      ],
    );
  }
}