import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/cubits/navigation_cubit/navigation_cubit.dart';
import 'package:reservision_app/screens/cities_screen.dart';
import 'package:reservision_app/screens/main_screen.dart';
import 'package:reservision_app/screens/profile_screen.dart';
import 'package:reservision_app/screens/reservision_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // int _selectedIndex = 0;
  final List<Widget> _screens = const [
    MainScreen(),
    CitiesScreen(),
    ReservisionScreen(),
    ProfileScreen(),
  ];

  // void _onItemTapped(int index) {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, currentIndex) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: IndexedStack(index: currentIndex, children: _screens),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              selectedItemColor: Colors.green,
              unselectedItemColor: Colors.grey,
              onTap: (index) {
                context.read<NavigationCubit>().goTo(index);
              },
              type:
                  BottomNavigationBarType
                      .fixed, // لأظهار نصوص الايقونات بدون الضغط عليها
              backgroundColor: Colors.amber[50],
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
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
