import 'package:flutter/material.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/widgets/common/app_bar_with_search.dart';
import 'package:reservision_app/widgets/common/category_card.dart';
import 'package:reservision_app/widgets/common/my_drawer.dart';
import 'package:reservision_app/widgets/common/section_header.dart';
import 'package:reservision_app/widgets/home/field_search_bar.dart';
import 'package:reservision_app/widgets/home/upcoming_booking_carousel.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Map<String, dynamic>> categories = [
    {'icon': Icons.sports_soccer, 'label': 'كرة القدم', 'soon': ''},
    {
      'icon': Icons.sports_basketball,
      'label': 'كرة السلة',
      'soon': 'قريباً...',
    },
    {
      'icon': Icons.sports_volleyball,
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
        title: 'ملاعبك',
        onNotification: () {
          // Handle profile icon tap
          print('Notification icon tapped!');
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'مرحباً',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: kTextDark,
                ),
              ),

              const SizedBox(height: 5),
              const FieldSearchBar(),

              const SizedBox(height: 10),
              SectionHeader(
                title: 'الملاعب',
                onPressed: () {
                  // Navigate to upcoming bookings list
                  print('View All Upcoming Bookings!');
                },
              ),
              const SizedBox(height: 5),

              UpcomingBookingsCarousel(),

              const SizedBox(height: 10),
              SectionHeader(title: 'الفئات'),

              GridView.builder(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(), // Disable scrolling in GridView
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.3, // يساوي المسافة العمودية
                ),
                itemCount: categories.length, // Example categories
                itemBuilder: (context, index) {
                  return CategoryCard(
                    icon: categories[index]['icon'],
                    label: categories[index]['label'],
                    soon: categories[index]['soon'],
                    onTap: () {
                      print('${categories[index]['label']} category tapped!');
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
