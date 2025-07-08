import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/cubits/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:reservision_app/cubits/profile_cubit/profile_cubit.dart';
import 'package:reservision_app/cubits/profile_cubit/profile_state.dart';
import 'package:reservision_app/helper/exit.dart';
import 'package:reservision_app/screens/about_us.dart';
import 'package:reservision_app/widgets/profile_widgets/profile_functions/pick_image_function.dart';
import 'package:reservision_app/widgets/profile_widgets/profile_functions/show_full_image_function.dart';
import 'package:reservision_app/widgets/profile_widgets/profile_image_widget.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: kPrimaryColor),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: kWhiteColor,
                  child: BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      return ProfileImageWidget(
                        imageFile: state.profileImage,
                        onTap: () {
                          print('تم الضغط على الصورة');
                          showFullImage(context, state.profileImage);
                        },
                        widget: Text(''),
                      );
                    },
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
            leading: const Icon(Icons.contact_support_rounded),
            title: const Text('عن التطبيق'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return AboutAppScreen();
                  },
                ),
              );
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
            onTap: () async {
              final shouldExit = await showExitConfirmation(context);
              if (shouldExit == true) {
                exit(0); // إغلاق التطبيق تمامًا
              }
            },
          ),
        ],
      ),
    );
  }
}
