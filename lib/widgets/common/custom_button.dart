import 'package:flutter/material.dart';
import 'package:reservision_app/constants/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: BoxDecoration(
          color: Color(0xff157D1A),
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
            color: kBlackColor, // لون الحدود
            width: 2.0, // عرض الحدود (اختياري)
          ),
        ),
        child: Center(
          child: Text(text, style: TextStyle(color: kWhiteColor, fontSize: 20)),
        ),
      ),
    );
  }
}
