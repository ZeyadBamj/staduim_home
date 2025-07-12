import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reservision_app/constants/images_constants.dart';
import 'package:reservision_app/constants/text_style_constants.dart';
import 'package:reservision_app/cubits/home_cubit/home_cubit.dart';
import 'package:reservision_app/widgets/common_widgets/custom_app_bar.dart';
import 'package:reservision_app/widgets/main_widgets/category_card.dart';
import 'package:reservision_app/widgets/common_widgets/my_drawer.dart';
import 'package:reservision_app/widgets/main_widgets/field_search_bar.dart';
import 'package:reservision_app/widgets/main_widgets/upcoming_booking_carousel.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Map<String, dynamic>> categories = const [
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
    final cubit = context.read<HomeCubit>();
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus(); // ← يخفي لوحة المفاتيح ويزيل التركيز
      },
      child: Scaffold(
        drawer: const MyDrawer(), // my_drawer.dart
        appBar: const CustomAppBar(title: ''),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('مرحباً', style: MainStyle.kGreetingText),
                  Text('👋', style: TextStyle(fontSize: 50)),
                  Text('Welcome', style: MainStyle.kGreetingText),
                ],
              ),
      
              const SizedBox(height: 5),
              const FieldSearchBar(),
      
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(kFieldImage, height: 60),
                  const Text('الملاعب', style: MainStyle.kMainText),
                ],
              ),
              const SizedBox(height: 5),
      
              const UpcomingBookingsCarousel(),
      
              const SizedBox(height: 20),
      
              Row(
                children: [
                  const SizedBox(width: 15),
                  Image.asset(kCategoryImage, height: 30),
                  const SizedBox(width: 15),
                  const Text('الفئات', style: MainStyle.kMainText),
                ],
              ),
              const SizedBox(height: 10),
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
                        cubit.goTo(1);
                      }
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
