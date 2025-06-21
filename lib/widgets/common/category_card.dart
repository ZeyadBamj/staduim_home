import 'package:flutter/material.dart';
import 'package:reservision_app/constants/constants.dart';

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label, soon;
  final void Function()? onTap;

  const CategoryCard({
    super.key,
    required this.icon,
    required this.label,
    required this.soon,
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
              color: kBlackColor.withValues(alpha: 0.2), // خلفية للأيقونات
              shape: BoxShape.circle,
              border: Border.all(color: kBorderColor, width: 2),
            ),
            child: Icon(icon, color: kPrimaryGreen, size: 35),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: kTextDark,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            soon,
            style: TextStyle(
              fontSize: 12,
              color: kTextDark,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
