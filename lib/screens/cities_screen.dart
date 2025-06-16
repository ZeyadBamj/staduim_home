import 'package:flutter/material.dart';
import 'package:reservision_app/widgets/common/app_bar_with_search.dart';
import 'package:reservision_app/widgets/common/my_drawer.dart';

class CitiesScreen extends StatelessWidget {
  const CitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBarWithSearch(
        title: 'ملاعبك',
        
        onNotification: () {
          // Handle profile icon tap
          print('Notification icon tapped!');
        },
      ),
      body: Center(child: Text('Cities Page')),
    );
  }
}
