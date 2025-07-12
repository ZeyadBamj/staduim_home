import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/constants/text_style_constants.dart';
import 'package:reservision_app/cubits/home_cubit/home_cubit.dart';
import 'package:reservision_app/helper/show_confirm_dialog.dart';
import 'package:reservision_app/helper/media_query.dart';
import 'package:reservision_app/screens/common_screens/about_us.dart';
import 'package:reservision_app/screens/common_screens/contact_with_us_screen.dart';

class OwnerDrawer extends StatelessWidget {
  const OwnerDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: mediaQueryWidth(context, width: 0.6),
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: kPrimaryColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'مرحبًا بك!',
                  style: TextStyle(color: kWhiteColor, fontSize: 18),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: kBlackColor),
            title: const Text('الرئيسية', style: MyDrawerStyle.kIcon),
            onTap: () {
              Navigator.pop(context);
              context.read<HomeCubit>().goTo(0);
              // انتقل للصفحة الرئيسية
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.contact_support_rounded,
              color: kBlackColor,
            ),
            title: const Text('عن التطبيق', style: MyDrawerStyle.kIcon),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const AboutAppScreen();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.contactless_rounded, color: kBlackColor),
            title: const Text('تواصل معنا', style: MyDrawerStyle.kIcon),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const ContactWithUsScreen();
                  },
                ),
              );
            },
          ),
          const Divider(thickness: 2, color: kPrimaryColor),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: kRedColor,
              shadows: [kShadow(color: kRedColor, blurRadius: 5)],
            ),
            title: Text('تسجيل الخروج', style: ExitTextStyle.kExitText),
            onTap: () async {
              final shouldExit = await showConfirmDialog(
                context,
                title: 'تأكيد الخروج',
                content: Text(
                  'هل تريد الخروج من التطبيق؟',
                  style: TextStyle(fontSize: 18),
                ),
                noText: 'لا',
                onNo: () => Navigator.of(context).pop(false),
                yesText: 'نعم',
                onYes: () => Navigator.of(context).pop(true),
              );
              if (shouldExit == true) {
                // إغلاق التطبيق تمامًا
                SystemNavigator.pop();
              }
            },
          ),
        ],
      ),
    );
  }
}
