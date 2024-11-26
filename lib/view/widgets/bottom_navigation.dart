import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigation(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Colors.white;

    return Container(
      margin: const EdgeInsets.all(16),
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 0),
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(53)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MediaQuery.removePadding(
            context: context,
            removeBottom: true,
            child: BottomAppBar(
              clipBehavior: Clip.hardEdge,
              padding: EdgeInsets.zero,
              color: const Color(0xFF151619),
              shape: const CircularNotchedRectangle(),
              notchMargin: 8.0,
              child: BottomNavigationBar(
                iconSize: 16,
                backgroundColor: Colors.transparent,
                type: BottomNavigationBarType.fixed,
                currentIndex: currentIndex,
                elevation: 0,
                onTap: onTap,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white.withOpacity(0.3),
                selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                items: [
                  BottomNavigationBarItem(
                      icon: Padding(
                          padding: const EdgeInsets.only(bottom: 8, top: 8),
                          child: SvgPicture.asset('assets/images/ic_battery_alarm.svg', width: 16, height: 16, colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.3), BlendMode.srcIn))
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Container(
                          width: 34,
                          height: 34,
                          padding: const EdgeInsets.all(8),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF375CE1)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: SvgPicture.asset('assets/images/ic_battery_alarm.svg', width: 20, height: 20, colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
                          ),
                        ),
                      ),
                      label: 'Test'
                  ),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 8, top: 8),
                        child: SvgPicture.asset('assets/images/ic_battery_alarm.svg', width: 20, height: 20, colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.3), BlendMode.srcIn)),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Container(
                          width: 34,
                          height: 34,
                          padding: const EdgeInsets.all(8),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF375CE1)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: SvgPicture.asset('assets/images/ic_battery_alarm.svg', width: 20, height: 20, colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
                          ),
                        ),
                      ),
                      label: 'Test'
                  ),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 8, top: 8),
                        child: SvgPicture.asset('assets/images/ic_battery_alarm.svg', width: 20, height: 20, colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.3), BlendMode.srcIn)),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Container(
                          width: 34,
                          height: 34,
                          padding: const EdgeInsets.all(8),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF375CE1)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: SvgPicture.asset('assets/images/ic_battery_alarm.svg', width: 20, height: 20, colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
                          ),
                        ),
                      ),
                      label: 'Test'
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}