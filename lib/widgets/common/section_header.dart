import 'package:flutter/material.dart';
import 'package:reservision_app/constants/constants.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final String buttonText;

  const SectionHeader({
    super.key,
    required this.title,
    this.onPressed,
    this.buttonText = 'عرض الكل', // Default button text
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: kTextDark,
          ),
        ),
        if (onPressed != null)
          TextButton(
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
      ],
    );
  }
}
