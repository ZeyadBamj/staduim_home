import 'package:flutter/material.dart';
import 'package:reservision_app/constants/constants.dart';

class CustomElevatedButton extends StatelessWidget {
  final String city;
  final bool isSelected;
  final void Function()? onPressed;

  const CustomElevatedButton({
    super.key,
    required this.city,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          side: BorderSide(color: kPrimaryColor, width: 1),
          backgroundColor: isSelected ? kPrimaryColor : kWhiteColor,
          foregroundColor: isSelected ? kWhiteColor : kPrimaryColor,
          elevation: isSelected ? 5 : 0,
          padding: EdgeInsets.symmetric(horizontal: 20),
        ),
        child: Text(city, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
