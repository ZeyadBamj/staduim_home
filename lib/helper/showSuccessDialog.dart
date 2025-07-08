import 'package:flutter/material.dart';

void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // يمنع إغلاق الـ Dialog بالضغط خارجها
    builder:
        (context) => AlertDialog(
          title: const Text('تنبيه'),
          content: const Text('تم الحجز بنجاح ✅'),
        ),
  );

  // بعد 2 ثانية، يغلق الـ Dialog ثم ينتقل إلى واجهة "حجوزاتي"
  Future.delayed(const Duration(seconds: 2), () {
    Navigator.of(context).pop(); // يغلق الـ Dialog
    Navigator.of(context).pop(); // يغلق الـ Dialog
    Navigator.of(context).pop(); // يغلق الـ Dialog
  });
}
