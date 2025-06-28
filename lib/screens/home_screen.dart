import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/cubits/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:reservision_app/screens/exit_finger.dart';
import 'package:reservision_app/screens/cities_screen.dart';
import 'package:reservision_app/screens/main_screen.dart';
import 'package:reservision_app/screens/profile_screen.dart';
import 'package:reservision_app/screens/reservision_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Widget> _screens = const [
    MainScreen(),
    CitiesScreen(),
    ReservationScreen(),
    ProfileScreen(),
    ExitFingerScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BottomNavigationCubit>();
    return BlocBuilder<BottomNavigationCubit, int>(
      builder: (context, currentIndex) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: IndexedStack(index: currentIndex, children: _screens),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              selectedItemColor: kGreenColor,
              unselectedItemColor: kGreyColor,
              onTap: (index) {
                cubit.goTo(index);
              },
              type:
                  BottomNavigationBarType
                      .fixed, // لأظهار نصوص الايقونات بدون الضغط عليها
              backgroundColor: Colors.amber[100],
              selectedLabelStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                shadows: List.filled(
                  5,
                  kShadow(
                    color: kBlackColor,
                    blurRadius: 3,
                    offSet: Offset(0, 1),
                  ),
                ),
              ),
              selectedIconTheme: IconThemeData(
                shadows: List.filled(
                  20,
                  kShadow(color: kBlackColor, blurRadius: 5),
                ),
              ),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: 'الرئيسية',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.grid_view_outlined),
                  activeIcon: Icon(Icons.grid_view),
                  label: 'المدن',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today_outlined),
                  activeIcon: Icon(Icons.calendar_today),
                  label: 'حجوزاتي',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  activeIcon: Icon(Icons.person),
                  label: 'حسابي',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
