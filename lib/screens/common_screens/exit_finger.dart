import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reservision_app/constants/text_style_constants.dart';
import 'package:reservision_app/helper/show_confirm_dialog.dart';

class ExitFingerScreen extends StatelessWidget {
  const ExitFingerScreen({super.key});

  Future<bool> _onWillPop(BuildContext context) async {
    final confireExit = await showConfirmDialog(
      context,
      title: 'تأكيد الخروج',
      content: Text(
        'هل أنت متأكد أنك تريد الخروج من التطبيق؟',
        style: ShowConfirmDialogStyle.kContent,
      ),
      noText: 'لا',
      onNo: () {
        Navigator.of(context).pop(false);
      },
      yesText: 'نعم',
      onYes: () => exit(0),
    );
    return confireExit ?? false;
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
