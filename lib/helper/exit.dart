import 'package:flutter/material.dart';

Future<bool?> showExitConfirmation(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder:
        (context) => Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: const Text('تأكيد الخروج'),
            content: const Text('هل أنت متأكد أنك تريد الخروج من التطبيق؟'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false), // لا للخروج
                child: const Text('لا'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true), // نعم للخروج
                child: const Text('نعم'),
              ),
            ],
          ),
        ),
  );
}
