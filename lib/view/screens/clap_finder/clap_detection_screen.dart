import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:test_find_my_phone/utils/locator_support.dart';
import 'package:vibration/vibration.dart';
import 'package:audioplayers/audioplayers.dart';

class ClapDetectionScreen extends StatefulWidget {
  @override
  _ClapDetectionScreenState createState() => _ClapDetectionScreenState();
}

class _ClapDetectionScreenState extends State<ClapDetectionScreen> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: Stack(
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

              },
              child: Container(
                padding: const EdgeInsets.only(right: 12, left: 12, bottom: 12),
                child: Image.asset('assets/images/ic_setting.png', width: 28, height: 28,)
              )
            )
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(context.locale.swipe_to_select_custom_sound_alert, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white.withOpacity(0.6)),),
                Image.asset('assets/images/temp.png', height: 323,),
                Image.asset('assets/images/ic_arrow_down.png', height: 86,),
                const SizedBox(height: 8,),
                Text(context.locale.click_start_to_enable, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white.withOpacity(0.6)),),
                Text(context.locale.clap_finder_mode, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white.withOpacity(0.6)),),
                const SizedBox(height: 16,),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: !isActive ? const Color(0xFF4E5DFF).withOpacity(0.35) : const Color(0xFFC92929).withOpacity(0.33), // Màu viền
                      width: 1, // Độ dày viền
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: TextButton(
                      onPressed: (){
                        setState(() {
                          isActive = !isActive;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(colors: [!isActive ? const Color(0xFF297DFC) : const Color(0xFFFF4949), !isActive ? const Color(0xFF1221C2) : const Color(0xFFC82525), !isActive ? const Color(0xFF297DFC) : const Color(0xFFFF4949)], begin: Alignment.topCenter, end: Alignment.bottomCenter)
                        ),
                        width: 316,
                        height: 74,
                        child: Text(
                          !isActive ? context.locale.active : context.locale.stop,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),))

                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}