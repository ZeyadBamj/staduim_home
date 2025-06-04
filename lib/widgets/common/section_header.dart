import 'package:flutter/material.dart';
import 'package:reservision_app/constants/app_text_styles.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
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
        Text(title, style: AppTextStyles.sectionHeader),
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
