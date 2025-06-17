import 'package:flutter/material.dart';
import 'package:reservision_app/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kGreenColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.blueAccent, // لون الحدود
            width: 2.0, // عرض الحدود (اختياري)
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: kWhiteColor, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
