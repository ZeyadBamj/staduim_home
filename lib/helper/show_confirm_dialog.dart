import 'package:flutter/material.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/constants/text_style_constants.dart';

Future<bool?> showConfirmDialog(
  BuildContext context, {
  required String title,
  required Widget content,
  required String noText,
  required VoidCallback onNo,
  required String yesText,
  required VoidCallback onYes,
}) {
  return showDialog<bool>(
    context: context,
    builder:
        (context) => AlertDialog(
          backgroundColor: kGreenColor.shade300,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          content: content,
          actions: [
            TextButton(
              onPressed: onNo, // لا للخروج
              child: Text(noText, style: ShowConfirmDialogStyle.kNo),
            ),
            TextButton(
              onPressed: onYes, // نعم للخروج
              child: Text(yesText, style: ShowConfirmDialogStyle.kYes),
            ),
          ],
        ),
  );
}
