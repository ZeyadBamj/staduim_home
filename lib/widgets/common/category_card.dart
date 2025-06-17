import 'package:flutter/material.dart';
import 'package:reservision_app/constants/app_colors.dart';
import 'package:reservision_app/constants/app_text_styles.dart';

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: kPrimaryGreen.withValues(alpha: 0.1), // خلفية للأيقونات
              shape: BoxShape.circle,
              border: Border.all(color: kBorderColor, width: 2),
            ),
            child: Icon(icon, color: kPrimaryGreen, size: 30),
          ),
          const SizedBox(height: 8),
          Text(label, style: kCardLabel, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
