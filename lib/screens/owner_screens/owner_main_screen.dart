import 'package:flutter/material.dart';
import 'package:reservision_app/constants/colors_constants.dart';
import 'package:reservision_app/widgets/owner_widgets/common/owner_app_bar.dart';
import 'package:reservision_app/widgets/owner_widgets/common/owner_drawer.dart';

class OwnerMainScreen extends StatelessWidget {
  const OwnerMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const OwnerDrawer(),
      backgroundColor: kGreenColor.shade200,
      appBar: const OwnerAppBar(title: 'الرئيسية'),
      body: const Center(
        child: Text(
          '👋مرحباً بك في ملعبك للإدارة',
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
