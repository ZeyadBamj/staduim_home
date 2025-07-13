import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reservision_app/constants/colors_constants.dart';
import 'package:reservision_app/cubits/user_cubits/home_cubit/home_cubit.dart';
import 'package:reservision_app/screens/common/exit_finger.dart';
import 'package:reservision_app/screens/owner_screens/owner_control_screen.dart';
import 'package:reservision_app/screens/owner_screens/owner_details_screen.dart';
import 'package:reservision_app/screens/owner_screens/owner_main_screen.dart';
import 'package:reservision_app/screens/owner_screens/owner_notification_screen.dart';

class OwnerHome extends StatelessWidget {
  const OwnerHome({super.key});

  final List<Widget> _screens = const [
    OwnerMainScreen(),
    OwnerPlaygroundControlScreen(),
    OwnerDetailsScreen(),
    OwnerNotificationsScreen(),
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
            unselectedItemColor: kGreenColor.shade400,
            onTap: (index) {
              cubit.goTo(index);
            },
            type:
                BottomNavigationBarType
                    .fixed, // لأظهار نصوص الايقونات بدون الضغط عليها
            backgroundColor: kPrimaryColor,
            selectedLabelStyle: TextStyle(
              fontSize: 20,
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
                icon: Icon(FontAwesomeIcons.pen, size: 40),
                activeIcon: Icon(FontAwesomeIcons.pencil, size: 40),
                label: 'الإدارة',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.file, size: 40),
                activeIcon: Icon(FontAwesomeIcons.filePen, size: 40),
                label: 'تفاصيل',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.envelope, size: 40),
                activeIcon: Icon(FontAwesomeIcons.envelopeOpen, size: 40),
                label: 'الاشعارات',
              ),
            ],
          ),
        );
      },
    );
  }
}
