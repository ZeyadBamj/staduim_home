import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/constants/images_constants.dart';

void showFullImage(BuildContext context, File? imageFile) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        backgroundColor: kBlackColor,
        insetPadding: EdgeInsets.zero, // لا نريد هوامش للنوافذ
        child: GestureDetector(
          onTap: () => Navigator.of(context).pop(), // اغلاق عند الضغط بالخارج
          child: SizedBox.expand(
            child: InteractiveViewer(
              panEnabled: true, // السماح بالتحريك
              minScale: 0.5,
              maxScale: 4.0,
              child:
                  imageFile != null
                      ? Image.file(imageFile, fit: BoxFit.contain)
                      : Image.asset(kEnamImage, fit: BoxFit.contain),
            ),
          ),
        ),
      );
    },
  );
}
