import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/cubits/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:reservision_app/widgets/common/custom_app_bar.dart';
import 'package:reservision_app/widgets/common/category_card.dart';
import 'package:reservision_app/widgets/common/my_drawer.dart';
import 'package:reservision_app/widgets/home/field_search_bar.dart';
import 'package:reservision_app/widgets/home/upcoming_booking_carousel.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Map<String, dynamic>> categories = [
    {'icon': FontAwesomeIcons.futbol, 'label': 'كرة القدم', 'soon': ''},
    {
      'icon': FontAwesomeIcons.basketball,
      'label': 'كرة السلة',
      'soon': 'قريباً...',
    },
    {
      'icon': FontAwesomeIcons.volleyball,
      'label': 'الكرة الطائرة',
      'soon': 'قريباً...',
    },
    {'icon': Icons.sports_tennis, 'label': 'التنس', 'soon': 'قريباً...'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(), // my_drawer.dart
      appBar: CustomAppBar(
        title: '',
        onNotification: () {
          // Handle profile icon tap
          print('Notification icon tapped!');
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'مرحباً',
                  style: TextStyle(fontSize: 24, color: kPrimaryColor),
                ),
                Text('👋', style: TextStyle(fontSize: 50)),
                Text(
                  'Welcome',
                  style: TextStyle(fontSize: 24, color: kPrimaryColor),
                ),
              ],
            ),

            const SizedBox(height: 5),
            const FieldSearchBar(),

            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(kFieldImage, height: 60),
                Text('الملاعب', style: TextStyle(color: kPrimaryColor)),
              ],
            ),
            const SizedBox(height: 5),

            UpcomingBookingsCarousel(),

            const SizedBox(height: 10),

            Row(
              children: [
                const SizedBox(width: 15),
                Image.asset(kCategoryImage, height: 30),
                const SizedBox(width: 15),
                Text('الفئات', style: TextStyle(color: kPrimaryColor)),
              ],
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(), // Disable scrolling in GridView
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 10,
                childAspectRatio: 1.2, // يساوي المسافة العمودية
              ),
              itemCount: categories.length, // Example categories
              itemBuilder: (context, index) {
                return CategoryCard(
                  icon: categories[index]['icon'],
                  label: categories[index]['label'],
                  soon: categories[index]['soon'],
                  onTap: () {
                    if (categories[index] == categories[0]) {
                      context.read<BottomNavigationCubit>().goTo(1);
                    } else {
                      print('${categories[index]['label']} category tapped!');
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
