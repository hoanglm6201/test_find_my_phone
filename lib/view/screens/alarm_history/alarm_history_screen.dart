import 'package:flutter/material.dart';
import 'package:test_find_my_phone/data/model/alarm_history_model.dart';
import 'package:test_find_my_phone/utils/locator_support.dart';
import 'package:test_find_my_phone/view/screens/alarm_history/widgets/history_item.dart';
import 'package:test_find_my_phone/view/screens/alarm_history/widgets/history_tab.dart';

class AlarmHistoryScreen extends StatefulWidget {
  const AlarmHistoryScreen({super.key});

  @override
  State<AlarmHistoryScreen> createState() => _AlarmHistoryScreenState();
}

class _AlarmHistoryScreenState extends State<AlarmHistoryScreen> {

  List<AlarmHistoryModel> getListHistory(){
    return [
      AlarmHistoryModel('Hanoi, Vietnam', DateTime.now()),
      AlarmHistoryModel('Hanoi, Vietnam', DateTime.now()),
      AlarmHistoryModel('Hanoi, Vietnam', DateTime.now()),
      AlarmHistoryModel('Hanoi, Vietnam', DateTime.now()),
      AlarmHistoryModel('Hanoi, Vietnam', DateTime.now()),
      AlarmHistoryModel('Hanoi, Vietnam', DateTime.now()),
      AlarmHistoryModel('Hanoi, Vietnam', DateTime.now()),
      AlarmHistoryModel('Hanoi, Vietnam', DateTime.now()),
      AlarmHistoryModel('Hanoi, Vietnam', DateTime.now()),
      AlarmHistoryModel('Hanoi, Vietnam', DateTime.now()),
      AlarmHistoryModel('Hanoi, Vietnam', DateTime.now()),
      AlarmHistoryModel('Hanoi, Vietnam', DateTime.now()),
      AlarmHistoryModel('Hanoi, Vietnam', DateTime.now()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/img_background_1.png'), fit: BoxFit.fill)
        ),
        child: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: const EdgeInsets.only(left: 12),
                        width: 28,
                        height: 28,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: const Color(0xFF7D7D7D).withOpacity(0.2),
                            shape: BoxShape.circle
                        ),
                        child: IconButton(onPressed: (){
                          Navigator.pop(context);
                        }, icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 14, color: Colors.white,), padding: EdgeInsets.zero,),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(context.locale.alarm_history, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                Expanded(
                  child: DefaultTabController(
                    length: 3,
                    child: Column(
                      children: [
                        Container(
                          height: 47,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.13),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          child: TabBar(
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.white,
                            dividerColor: Colors.transparent,
                            labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                            indicator: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            indicatorSize: TabBarIndicatorSize.tab,
                            padding: const EdgeInsets.all(6),
                            tabs: const [
                              Tab(text: "Full"),
                              Tab(text: "Charging"),
                              Tab(text: "Low"),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Expanded(
                          child: TabBarView(
                            children: [
                              HistoryTab(items: getListHistory()),
                              HistoryTab(items: getListHistory()),
                              HistoryTab(items: getListHistory()),
                            ],
                          ),
                        ),
                      ]
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
    );
  }
}
