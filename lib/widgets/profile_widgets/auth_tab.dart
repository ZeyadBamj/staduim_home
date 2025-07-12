import 'package:flutter/material.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/cubits/profile_cubit/profile_cubit.dart';

class AuthTab extends StatelessWidget {
  final String title;
  final ProfileMode mode;
  final ProfileMode currentMode;
  final void Function()? onTap;

  const AuthTab({
    super.key,
    required this.title,
    required this.mode,
    required this.currentMode,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = currentMode == mode;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: isSelected ? kWhiteColor : Colors.transparent,
            border: Border(
              bottom: BorderSide(
                color: isSelected ? kWhiteColor : kPrimaryColor,
                width: 1,
              ),
            ),
            // borderRadius: BorderRadius.circular(2),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? kBlackColor : kWhiteColor,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: isSelected ? 18 : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
