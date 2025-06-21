import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/cubits/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: kGreenColor),
            child: Row(
              children: const [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: kWhiteColor,
                  child: Icon(
                    Icons.person,
                    size: 30,
                    color: kGreenColor,
                    shadows: [
                      Shadow(
                        color: kBlackColor,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'مرحبًا بك!',
                  style: TextStyle(color: kWhiteColor, fontSize: 18),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('الرئيسية'),
            onTap: () {
              Navigator.pop(context);
              context.read<BottomNavigationCubit>().goTo(0);
              // انتقل للصفحة الرئيسية
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('اللغة'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_support_rounded),
            title: const Text('عن التطبيق'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.contactless_rounded),
            title: const Text('تواصل معنا'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('الإعدادات'),
            onTap: () {
              Navigator.pop(context);
              // انتقل لصفحة الإعدادات
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: kRedColor,
              shadows: [kShadow(color: kRedColor, blurRadius: 5)],
            ),
            title: Text(
              'تسجيل الخروج',
              style: TextStyle(
                color: kRedColor,
                fontWeight: FontWeight.bold,
                shadows: [kShadow(color: kRedColor, blurRadius: 3)],
              ),
            ),
            onTap: () {
              // تسجيل الخروج
            },
          ),
        ],
      ),
    );
  }
}
