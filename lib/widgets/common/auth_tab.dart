import 'package:flutter/material.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/cubits/auth_cubit/auth_cubit.dart';

class AuthTab extends StatelessWidget {
  final String title;
  final AuthMode mode;
  final AuthMode currentMode;
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
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? kBlueColor.shade100 : Colors.transparent,
            border: Border(
              bottom: BorderSide(
                color: isSelected ? kBlueColor : kGreyColor,
                width: 1,
              ),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? kBlueColor : kWhiteColor,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: isSelected ? 16 : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
