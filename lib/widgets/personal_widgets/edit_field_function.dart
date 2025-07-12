import 'package:flutter/material.dart';
import 'package:reservision_app/helper/show_confirm_dialog.dart';

void editFieldFunction({
  required BuildContext context,
  required String title,
  required String initialValue,
  required void Function(String) onSave,
}) {
  final controller = TextEditingController(text: initialValue);
  showConfirmDialog(
    context,
    title: title,
    content: TextField(controller: controller),
    noText: 'إلغاء',
    onNo: () => Navigator.pop(context),
    yesText: 'تعديل',
    onYes: () {
      onSave(controller.text.trim());
      Navigator.pop(context);
    },
  );
}
