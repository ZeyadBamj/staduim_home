import 'package:flutter/material.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/widgets/owner_widgets/owner_app_bar.dart';
import 'package:reservision_app/widgets/owner_widgets/owner_drawer.dart';

class OwnerMainScreen extends StatelessWidget {
  const OwnerMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: OwnerDrawer(),
      backgroundColor: kGreenColor.shade200,
      appBar: OwnerAppBar(title: 'الرئيسية'),
      body: Center(
        child: Text(
          '👋مرحباً بك في ملعبك للإدارة',
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
