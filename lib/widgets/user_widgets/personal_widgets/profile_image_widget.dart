import 'dart:io';
import 'package:flutter/material.dart';
import 'package:reservision_app/constants/colors_constants.dart';
import 'package:reservision_app/constants/images_constants.dart';

// lib/widgets/profile_image_widget.dart
class ProfileImageWidget extends StatelessWidget {
  final File? imageFile;
  final VoidCallback? onEdit;
  final VoidCallback onTap;
  final Widget? widget;

  const ProfileImageWidget({
    super.key,
    required this.imageFile,
    this.onEdit,
    required this.onTap,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap, // تأكد من هذا السطر
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80),
              side: BorderSide(color: kPrimaryColor, width: 3),
            ),
            elevation: 10,
            child: CircleAvatar(
              radius: 80,
              backgroundImage:
                  imageFile != null
                      ? FileImage(imageFile!)
                      : const AssetImage(kEnamImage) as ImageProvider,
            ),
          ),
        ),

        widget ??
            Positioned(
              bottom: 0,
              right: 10,
              child: InkWell(
                onTap: onEdit,
                child: const CircleAvatar(
                  radius: 20,
                  backgroundColor: kBlueColor,
                  child: Icon(Icons.edit, size: 20, color: kWhiteColor),
                ),
              ),
            ),
      ],
    );
  }
}
