import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // لإغلاق التطبيق

class ExitFingerScreen extends StatelessWidget {
  const ExitFingerScreen({super.key});

  Future<bool> _onWillPop(BuildContext context) async {
    final shouldExit = await showDialog<bool>(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('تأكيد الخروج'),
            content: const Text('هل أنت متأكد أنك تريد الخروج من التطبيق؟'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('لا'),
              ),
              TextButton(onPressed: () => exit(0), child: const Text('نعم')),
            ],
          ),
    );
    return shouldExit ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        appBar: AppBar(title: const Text("الرئيسية")),
        body: const Center(child: Text("مرحباً بك في التطبيق!")),
      ),
    );
  }
}
