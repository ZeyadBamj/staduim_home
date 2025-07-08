import 'package:flutter/material.dart';
import 'package:reservision_app/constants/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    this.obscureText = false,
  });
  final String labelText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        border: customOutLInputB(color: kGreenColor),
        enabledBorder: customOutLInputB(color: kGreenColor),
      ),
      obscureText: obscureText,
    );
  }

  OutlineInputBorder customOutLInputB({required Color color}) =>
      OutlineInputBorder(
        borderSide: BorderSide(color: color, width: 2),
        borderRadius: BorderRadius.circular(24),
      );
}
