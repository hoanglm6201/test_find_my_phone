import 'package:flutter/material.dart';
import 'package:test_find_my_phone/utils/language.dart';
import 'package:test_find_my_phone/utils/locator_support.dart';
import 'package:test_find_my_phone/view/screens/language/widgets/language_item.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int _selectedIndex = 7;

  void onSelectedIndexChange(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final items = Language(context).languageItems;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/img_background_1.png'), fit: BoxFit.fill)
        ),
        child: SafeArea(
          child: Column(
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
                    child: Text(context.locale.text_language, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
                  )
                ],
              ),
              const SizedBox(height: 20,),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: () => onSelectedIndexChange(index),
                      child: LanguageItem(languageModel: items[index], isSelected: _selectedIndex == index));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
