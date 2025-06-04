import 'package:flutter/material.dart';
import 'package:reservision_app/constants/app_colors.dart';

class FieldSearchBar extends StatelessWidget {
  const FieldSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        // readOnly: true, // Make it read-only to act as a button
        onTap: () {
          print('Search field tapped!');
        },
        decoration: InputDecoration(
          hintText: 'ابحث عن ملعبك ...',
          hintStyle: TextStyle(color: AppColors.textLight.withOpacity(0.7)),
          suffixIcon: const Icon(Icons.search, color: AppColors.textLight),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 10.0,
          ),
        ),
      ),
    );
  }
}
