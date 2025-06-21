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
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? kGreenColor : kBorderColor,
          foregroundColor: isSelected ? kWhiteColor : kBlackColor,
        ),
        child: Text(city),
      ),
    );
  }
}
