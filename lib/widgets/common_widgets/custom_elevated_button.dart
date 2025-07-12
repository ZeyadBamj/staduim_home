import 'package:flutter/material.dart';
import 'package:reservision_app/constants/constants.dart';

class CustomElevatedButton extends StatelessWidget {
  final String name;
  final bool isSelected;
  final void Function()? onPressed;
  final EdgeInsetsGeometry padding;

  const CustomElevatedButton({
    super.key,
    required this.name,
    required this.isSelected,
    required this.onPressed, 
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          side: BorderSide(color: kPrimaryColor, width: 2),
          backgroundColor: isSelected ? kPrimaryColor : kWhiteColor,
          foregroundColor: isSelected ? kWhiteColor : kPrimaryColor,
          elevation: isSelected ? 5 : 0,
          padding: padding,
        ),
        child: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
