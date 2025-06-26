import 'dart:io';
import 'package:flutter/material.dart';
import 'package:reservision_app/constants/constants.dart';

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
          child: CircleAvatar(
            radius: 50,
            backgroundImage:
                imageFile != null
                    ? FileImage(imageFile!)
                    : const AssetImage(kEnamImage) as ImageProvider,
          ),
        ),

        widget ??
            Positioned(
              bottom: 0,
              right: 0,
              child: InkWell(
                onTap: onEdit,
                child: const CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.edit, size: 16, color: Colors.white),
                ),
              ),
            ),
      ],
    );
  }
}
