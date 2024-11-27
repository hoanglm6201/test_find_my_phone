import 'package:flutter/material.dart';
import 'package:test_find_my_phone/data/model/language_model.dart';
import 'package:test_find_my_phone/utils/language.dart';

class LanguageItem extends StatefulWidget {
  final LanguageModel languageModel;
  final bool isSelected;
  const LanguageItem({super.key, required this.languageModel, required this.isSelected});

  @override
  State<LanguageItem> createState() => _LanguageItemState();
}

class _LanguageItemState extends State<LanguageItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      margin: const EdgeInsets.only(left: 17, right: 17, bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const SizedBox(width: 20,),
              CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage(widget.languageModel.asset),
              ),
              const SizedBox(width: 20,),
              Text(widget.languageModel.language, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white),)
            ]
          ),
          if(widget.isSelected)
            const Row(
              children: [
                Icon(Icons.check_circle_sharp, color: Colors.white, weight: 3, size: 28,),
                SizedBox(width: 14,)
              ],
            ),
        ],
      ),
    );
  }
}
