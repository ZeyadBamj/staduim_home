import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/constants/app_colors.dart';
import 'package:reservision_app/cubits/navigation_cubit/navigation_cubit.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: kGreenColor),
            child: Row(
              children: const [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: kWhiteColor,
                  child: Icon(Icons.person, size: 30, color: kGreenColor),
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
              context.read<NavigationCubit>().goTo(0);
              // انتقل للصفحة الرئيسية
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('اللغة'),
            onTap: () {
              Navigator.pop(context);
              // انتقل لصفحة الحجوزات
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_support_rounded),
            title: const Text('عن التطبيق'),
            onTap: () {
              Navigator.pop(context);
              // انتقل لصفحة المدن
            },
          ),
          ListTile(
            leading: const Icon(Icons.contactless_rounded),
            title: const Text('تواصل معنا'),
            onTap: () {
              Navigator.pop(context);
              // انتقل لصفحة المدن
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
            leading: const Icon(Icons.logout, color: kRedColor),
            title: const Text('تسجيل الخروج', style: TextStyle(color: kRedColor)),
            onTap: () {
              // تسجيل الخروج
            },
          ),
        ],
      ),
    );
  }
}
