import 'package:flutter/material.dart';

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
          title: Text(title),
          content: TextField(controller: controller),
          actions: [
            TextButton(
              child: const Text("إلغاء"),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text("حفظ"),
              onPressed: () {
                onSave(controller.text.trim());
                Navigator.pop(context);
              },
            ),
          ],
        ),
  );
}
