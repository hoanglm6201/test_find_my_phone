import 'package:flutter/material.dart';
import 'package:test_find_my_phone/view/screens/battery_alarm/battery_alarm_screen.dart';
import 'package:test_find_my_phone/view/screens/clap_finder/clap_detection_screen.dart';
import 'package:test_find_my_phone/view/widgets/bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [const ClapDetectionScreen(), const BatteryAlarmScreen(), const ClapDetectionScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          extendBodyBehindAppBar: true,
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomNavigation(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
          body:IndexedStack(
            index: _selectedIndex,
            children: _pages,
          ),
        )
      ],
    );
  }
}
