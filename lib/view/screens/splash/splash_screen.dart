import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_find_my_phone/utils/locator_support.dart';
import 'package:test_find_my_phone/view/screens/clap_finder/clap_detection_screen.dart';
import 'package:test_find_my_phone/view/screens/home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _progressValue = 0.0;

  @override
  void initState() {
    super.initState();
    _simulateLoading();
  }

  void _simulateLoading() {
    // Tăng dần giá trị progress
    Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
      setState(() {
        _progressValue += 0.04; // Tăng mỗi lần lặp
        if (_progressValue >= 1.0) {
          timer.cancel();
          _navigateToHome();
        }
      });
    });
  }

  void _navigateToHome() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/ic_logo_splash.png', width: 140, height: 140,),
                  const SizedBox(height: 40,)
                ],
              )
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40, top: 8, bottom: 8),
                    child: Stack(
                      children: [
                        // Nền thanh tiến trình
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 6,
                            color: Colors.grey[300],
                          ),
                        ),
                        // Thanh tiến trình gradient
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 6,
                            width: MediaQuery.of(context).size.width * _progressValue,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF297DFC), Color(0xFF1221C2)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 112,)
                ],
              )
            )
        
          ],
        ),
      ),
    );
  }
}
