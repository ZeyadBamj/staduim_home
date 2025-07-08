import 'package:flutter/material.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/widgets/common/owner_app_bar.dart';

class OwnerDetailsScreen extends StatelessWidget {
  const OwnerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreenColor.shade200,
      appBar: OwnerAppBar(title: 'إضافة تفاصيل'),
    );
  }
}
