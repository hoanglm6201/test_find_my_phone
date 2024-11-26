import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_find_my_phone/utils/locator_support.dart';
import 'package:test_find_my_phone/view/screens/language/language_screen.dart';
import 'package:test_find_my_phone/view/screens/setting/widgets/custom_switch.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isSwitch = false;

  void onChangeSwitch(){
    setState(() {
      isSwitch = !isSwitch;
    });
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
          child: SingleChildScrollView(
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
                      child: Text(context.locale.setting, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
                    )
                  ],
                ),

                // Clap Finder
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 22, bottom: 12), // Align the text to the left
                  child: Text(
                    context.locale.clap_finder,
                    style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  height: 150,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(17)),
                    image: DecorationImage(image: AssetImage('assets/images/frame_setting.png'), fit: BoxFit.fill)
                  ),
                  child: Column(
                    children: [
                      _buildSettingRow(context, title: context.locale.duration, trailing: InkWell(onTap: () => _showDurationBottomSheet(),child: _buildRoundedButton('5s'))),
                      _buildSettingRow(context, title: context.locale.vibration, trailing: InkWell(onTap: () => _showVibrationBottomSheet(),child: _buildRoundedButton(context.locale.sos))),
                      _buildSettingRow(context, title: context.locale.flash_light, trailing: Stack(
                        children: [
                          SizedBox(
                            height: 24,
                            child: CustomSwitch(
                              width: 44, height: 24, switchWidth: 20, switchHeight: 20,
                              value: isSwitch,
                              onChanged: (bool newValue){
                                onChangeSwitch();
                              },
                            )
                          ),
                          if(isSwitch)
                            Positioned(
                                bottom: 0,
                                child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(42),
                                      bottomRight: Radius.circular(42),
                                    ),
                                    child: Image.asset('assets/images/button_blur.png', fit: BoxFit.cover, height: 10, width: 44,)))
                        ]
                      ),),
                    ],
                  ),
                ),

                // General
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 22, bottom: 12), // Align the text to the left
                  child: Text(
                    context.locale.text_general,
                    style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  height: 235,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(17)),
                      image: DecorationImage(image: AssetImage('assets/images/frame_setting.png'), fit: BoxFit.fill)
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10,),
                      _buildSettingRow(context, title: context.locale.text_language, trailing: InkWell(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LanguageScreen())),child: _buildRoundedButton(context.locale.english, width: 84))),
                      _buildSettingRow(context, title: context.locale.share_with_friends, trailing: Container()),
                      _buildSettingRow(context, title: context.locale.rate_us, trailing: Container()),
                      _buildSettingRow(context, title: context.locale.term_of_service, trailing: Container()),
                      _buildSettingRow(context, title: context.locale.policy_privacy, trailing: Container()),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingRow(BuildContext context,
      {required String title, required Widget trailing}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold
            ),
          ),
          trailing,
        ],
      ),
    );
  }

  Widget _buildRoundedButton(String text, {double width = 64}) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [
          Color(0xFF3770A5),
          Color(0xFF333FA2),
          Color(0xFF3FA3C3)
        ], begin: Alignment.topRight, end: Alignment.bottomLeft),
        borderRadius: BorderRadius.circular(42),
      ),
      padding: const EdgeInsets.all(2),
      child: Stack(
        children: [
          Container(
            width: width,
            height: 24,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFF2532C8),
              borderRadius: BorderRadius.circular(42),
            ),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          Positioned(
            bottom: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(42),
                bottomRight: Radius.circular(42),
              ),
              child: Image.asset('assets/images/button_blur.png', fit: BoxFit.cover, height: 10, width: 64,)))
        ]
      ),
    );
  }
  
  void _showDurationBottomSheet(){
    showCupertinoModalPopup(context: context, builder: (context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: (){
              Navigator.pop(context);

            }, isDefaultAction: true,
            child: const Text('15s', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Color(0xFF0078FF))),
          ),
          CupertinoActionSheetAction(
            onPressed: (){
              Navigator.pop(context);

            }, isDefaultAction: true,
            child: const Text('30s', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Color(0xFF0078FF))),
          ),
          CupertinoActionSheetAction(
            onPressed: (){
              Navigator.pop(context);

            }, isDefaultAction: true,
            child: const Text('60s', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Color(0xFF0078FF))),
          ),
          CupertinoActionSheetAction(
            onPressed: (){
              Navigator.pop(context);

            }, isDefaultAction: true,
            child: Text(context.locale.time_3_minutes, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Color(0xFF0078FF))),
          ),
          CupertinoActionSheetAction(
            onPressed: (){
              Navigator.pop(context);

            }, isDefaultAction: true,
            child: Text(context.locale.text_constantly, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Color(0xFF0078FF))),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: (){
            Navigator.pop(context);
          }, isDefaultAction: true,
          child: Text(context.locale.cancel, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black)),
        ),
      ),
    ));
  }

  void _showVibrationBottomSheet(){
    showCupertinoModalPopup(context: context, builder: (context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: (){
              Navigator.pop(context);

            }, isDefaultAction: true,
            child: Text(context.locale.sos, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Color(0xFF0078FF))),
          ),
          CupertinoActionSheetAction(
            onPressed: (){
              Navigator.pop(context);

            }, isDefaultAction: true,
            child: Text(context.locale.rapid, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Color(0xFF0078FF))),
          ),
          CupertinoActionSheetAction(
            onPressed: (){
              Navigator.pop(context);

            }, isDefaultAction: true,
            child: Text(context.locale.symphony, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Color(0xFF0078FF))),
          ),
          CupertinoActionSheetAction(
            onPressed: (){
              Navigator.pop(context);

            }, isDefaultAction: true,
            child: Text(context.locale.text_none, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Color(0xFF0078FF))),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: (){
            Navigator.pop(context);
          }, isDefaultAction: true,
          child: Text(context.locale.cancel, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black)),
        ),
      ),
    ));
  }
}
