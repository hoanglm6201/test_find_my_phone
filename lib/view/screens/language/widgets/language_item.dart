import 'package:flutter/material.dart';

class LanguageItem extends StatefulWidget {
  const LanguageItem({super.key});

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
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(width: 20,),
              CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage('assets/images/img_background.png'),
              ),
              SizedBox(width: 20,),
              Text('Spanish', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white),)
            ]
          ),
        ],
      ),
    );
  }
}
