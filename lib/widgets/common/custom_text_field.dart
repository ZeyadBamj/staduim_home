import 'package:flutter/material.dart';
import 'package:reservision_app/constants/colors_constants.dart';
import 'package:reservision_app/helper/custom_border.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    this.obscureText = false,
    this.keyboardType = TextInputType.name,
  });
  final String labelText;
  final bool obscureText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: kBlackColor),
        enabledBorder: customBorder(color: kGreenColor, width: 2),
        focusedBorder: customBorder(color: kPrimaryColor, width: 3),
      ),
      obscureText: obscureText,
    );
  }
}
