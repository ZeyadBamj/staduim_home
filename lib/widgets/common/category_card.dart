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
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: kPrimaryColor, // خلفية للأيقونات
              shape: BoxShape.circle,
              border: Border.all(color: kPrimaryColor, width: 2),
            ),
            child: Icon(icon, color: kWhiteColor, size: 70),
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: kBlackColor,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            soon,
            style: const TextStyle(
              fontSize: 14,
              color: kBlackColor,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
