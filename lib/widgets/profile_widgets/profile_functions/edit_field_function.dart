import 'package:flutter/material.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/constants/text_style_constants.dart';

void editFieldFunction({
  required BuildContext context,
  required String title,
  required String initialValue,
  required void Function(String) onSave,
}) {
  final controller = TextEditingController(text: initialValue);
  showDialog(
    context: context,
    builder:
        (_) => AlertDialog(
          backgroundColor: kGreenColor.shade300,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(title),
          content: TextField(controller: controller),
          actions: [
            TextButton(
              child: const Text("إلغاء", style: ShowConfirmDialogStyle.kNo),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text("تعديل", style: ShowConfirmDialogStyle.kYes),
              onPressed: () {
                onSave(controller.text.trim());
                Navigator.pop(context);
              },
            ),
          ],
        ),
  );
}
