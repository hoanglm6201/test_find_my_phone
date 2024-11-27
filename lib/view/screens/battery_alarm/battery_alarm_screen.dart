import 'package:flutter/material.dart';
import 'package:test_find_my_phone/utils/language.dart';
import 'package:test_find_my_phone/utils/locator_support.dart';
import 'package:test_find_my_phone/view/screens/alarm_history/alarm_history_screen.dart';
import 'package:test_find_my_phone/view/screens/setting/setting_screen.dart';
import 'package:test_find_my_phone/view/screens/setting/widgets/custom_switch.dart';

class BatteryAlarmScreen extends StatefulWidget {
  const BatteryAlarmScreen({super.key});

  @override
  State<BatteryAlarmScreen> createState() => _BatteryAlarmScreenState();
}

class _BatteryAlarmScreenState extends State<BatteryAlarmScreen> {
  bool isSwitchedCharing = false;
  bool isSwitchedFull = false;
  bool isSwitchedLow = false;

  void onCharingChanged(bool value){
    setState(() {
      isSwitchedCharing = value;
    });
  }

  void onFullChanged(bool value){
    setState(() {
      isSwitchedFull = value;
    });
  }

  void onLowChanged(bool value){
    setState(() {
      isSwitchedLow = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(image: AssetImage('assets/images/img_background.png'), fit: BoxFit.cover)
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Image.asset('assets/images/ic_find_my_phone.png', width: 136, height: 21,),
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                      borderRadius: BorderRadius.circular(28),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingScreen()));
                      },
                      child: Container(
                          padding: const EdgeInsets.only(right: 12, left: 12, bottom: 12),
                          child: Image.asset('assets/images/ic_setting.png', width: 28, height: 28, fit: BoxFit.cover,)
                      )
                  )
              ),
              Column(
                children: [
                  const SizedBox(height: 50,),
                  _buildSwitchContainer(context.locale.charing, context.locale.charing_description, (newValue) => onCharingChanged(newValue)),
                  const SizedBox(height: 16,),
                  _buildSwitchContainer(context.locale.text_full, context.locale.full_description, (newValue) => onFullChanged(newValue)),
                  const SizedBox(height: 16,),
                  _buildSwitchContainer(context.locale.text_low, context.locale.low_description, (newValue) => onLowChanged(newValue)),
                  const SizedBox(height: 24,),
                  _buildAlarmHistory()
                ],
              )
            ],
        )),
      ),
    );
  }

  void navigateToHistoryScreen(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const AlarmHistoryScreen()));
  }

  Widget _buildSwitchContainer(String title, String description, ValueChanged<bool> onChanged){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(1.5),
      width: double.infinity,
      height: 92,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [const Color(0xFF949CDF), const Color(0xFFA4ABE3).withOpacity(0.4)], begin: Alignment.topLeft, end: Alignment.bottomRight)
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.black.withOpacity(0.9)
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(colors: [const Color(0xFF297DFC).withOpacity(0.1), const Color(0xFF1221C2).withOpacity(0.1)], begin: Alignment.topCenter, end: Alignment.bottomCenter)
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                      Text(description,
                        style: TextStyle(height: 1.0,color: Colors.white.withOpacity(0.5), fontWeight: FontWeight.w400, fontSize: 14),
                        maxLines: 2, softWrap: true,overflow: TextOverflow.ellipsis,)
                    ],
                  ),
                ),
                CustomSwitch(
                  width: 44, height: 24, switchWidth: 20, switchHeight: 20,
                  value: false,
                  onChanged: (bool newValue){
                    onChanged(newValue);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAlarmHistory(){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (){
            navigateToHistoryScreen();
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFF4A4A4A).withOpacity(0.6),
              borderRadius: BorderRadius.circular(12)
            ),
            child: Text(context.locale.alarm_history, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
          ),
        ),
      ),
    );
  }
}
