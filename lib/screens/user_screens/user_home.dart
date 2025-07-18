import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reservision_app/constants/colors_constants.dart';
import 'package:reservision_app/cubits/user_cubits/home_cubit/home_cubit.dart';
import 'package:reservision_app/screens/common/exit_finger.dart';
import 'package:reservision_app/screens/user_screens/playgrounds_screen.dart';
import 'package:reservision_app/screens/user_screens/main_screen.dart';
import 'package:reservision_app/screens/user_screens/profile_screen.dart';
import 'package:reservision_app/screens/user_screens/reservision_screen.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});

  final List<Widget> _screens = const [
    MainScreen(),
    PlaygroundScreen(),
    ReservationScreen(),
    ProfileScreen(),
    // ExitFingerScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          body: IndexedStack(index: currentIndex, children: _screens),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            selectedItemColor: kWhiteColor,
            unselectedItemColor: kGreenColor.shade300,
            onTap: (index) {
              cubit.goTo(index);
            },
            type:
                BottomNavigationBarType
                    .fixed, // لأظهار نصوص الايقونات بدون الضغط عليها
            backgroundColor: kPrimaryColor,
            selectedLabelStyle: TextStyle(
              fontSize: 20,
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
                icon: Icon(FontAwesomeIcons.house, size: 40),
                activeIcon: Icon(FontAwesomeIcons.houseChimney, size: 40),
                label: 'الرئيسية',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.mapLocation, size: 40),
                activeIcon: Icon(FontAwesomeIcons.mapLocationDot, size: 40),
                label: 'المدن',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.calendar, size: 40),
                activeIcon: Icon(FontAwesomeIcons.calendarDays, size: 40),
                label: 'حجوزاتي',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.user, size: 40),
                activeIcon: Icon(FontAwesomeIcons.userLarge, size: 40),
                label: 'حسابي',
              ),
            ],
          ),
        );
      },
    );
  }
}
