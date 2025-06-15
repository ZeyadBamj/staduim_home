import 'package:flutter/material.dart';
import 'package:reservision_app/widgets/common/app_bar_with_search.dart';
import 'package:reservision_app/widgets/common/my_drawer.dart';

class ReservisionScreen extends StatelessWidget {
  const ReservisionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithSearch(
        title: 'ملاعبك',
        onMenuTap: () {
          // Handle menu icon tap
          print('Menu icon tapped!');
        },
        onNotification: () {
          // Handle profile icon tap
          print('Notification icon tapped!');
        },
      ),
      drawer: MyDrawer(),
      body: Center(child: Text('Reservision Page')),
    );
  }
}
