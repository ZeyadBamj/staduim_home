import 'package:flutter/material.dart';
import 'package:reservision_app/constants/app_colors.dart';
import 'package:reservision_app/constants/app_text_styles.dart';
import 'package:reservision_app/widgets/common/app_bar_with_search.dart';
import 'package:reservision_app/widgets/common/category_card.dart';
import 'package:reservision_app/widgets/common/section_header.dart';
import 'package:reservision_app/widgets/home/field_search_bar.dart';
import 'package:reservision_app/widgets/home/upcoming_booking_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 3; // For bottom navigation bar

  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.sports_soccer, 'label': 'كرة القدم'},
    {'icon': Icons.sports_basketball, 'label': 'كرة السلة'},
    {'icon': Icons.sports_volleyball, 'label': 'الكرة الطائرة'},
    {'icon': Icons.sports_tennis, 'label': 'التنس'},
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithSearch(
        title: 'ملاعبك',
        onProfileTap: () {
          // Handle profile icon tap
          print('Profile icon tapped!');
        },
        onMenuTap: () {
          // Handle menu icon tap
          print('Menu icon tapped!');
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('مرحباً', style: AppTextStyles.greetingText),
              const SizedBox(height: 20),

              const FieldSearchBar(),
              const SizedBox(height: 20),

              SectionHeader(
                title: 'الحجوزات القادمة',
                onPressed: () {
                  // Navigate to upcoming bookings list
                  print('View All Upcoming Bookings!');
                },
              ),
              const SizedBox(height: 10),
              UpcomingBookingCard(
                fieldName: 'ملعب إنماء الجديدة (الكبير)',
                date: '25 يوليو',
                time: '10:00 م',
                imageUrl: 'assets/images/enma_staduim.jpg', // Placeholder image
                onTap: () {
                  // Handle booking card tap
                  print('Booking card tapped!');
                },
              ),
              const SizedBox(height: 20),

              SectionHeader(title: 'الفئات'),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(), // Disable scrolling in GridView
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // يساوي المسافة الافقية بين الفئات
                  crossAxisSpacing: 10,
                  // mainAxisSpacing: 10,
                  childAspectRatio: 0.8, // يساوي المسافة العمودية
                ),
                itemCount: 4, // Example categories
                itemBuilder: (context, index) {
                  return CategoryCard(
                    icon: categories[index]['icon'],
                    label: categories[index]['label'],
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'حسابي',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            activeIcon: Icon(Icons.calendar_today),
            label: 'حجوزاتي',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_outlined),
            activeIcon: Icon(Icons.grid_view),
            label: 'المدن',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primaryGreen,
        unselectedItemColor: AppColors.textLight,
        onTap: _onItemTapped,
        type:
            BottomNavigationBarType
                .fixed, // لأظهار نصوص الايقونات بدون الضغط عليها
        backgroundColor: Colors.amber[50],
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
