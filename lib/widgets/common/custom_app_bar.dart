import 'package:flutter/material.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/screens/notification_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final void Function()? onSearchTap;
  final void Function()? onNotification;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onSearchTap,
    this.onNotification,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            kIconImage,
            width: MediaQuery.of(context).size.width * 0.1,
          ),
          Padding(padding: const EdgeInsets.only(right: 5), child: Text(title)),
        ],
      ),
      backgroundColor: kGreenColor,
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_active, color: kWhiteColor),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return NotificationsScreen();
                },
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
