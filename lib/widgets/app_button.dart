import 'package:deneme_app/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Function() onTap;

  const AppButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding:  EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: AppColor.green,
          ),
          child: Center(
            child: Text(title, style: TextStyle(
                color: AppColor.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                
            ),),
          ),
        ),
      ),
    );
  }
}
