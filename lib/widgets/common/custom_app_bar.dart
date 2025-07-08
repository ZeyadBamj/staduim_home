import 'package:flutter/material.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/screens/notification_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final void Function()? onNotification;

  const CustomAppBar({
    super.key,
    required this.title,
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
            kBallImage,
            width: MediaQuery.of(context).size.width * 0.12,
          ),
          Padding(padding: const EdgeInsets.only(right: 5), child: Text(title)),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.notifications_on_outlined,
            color: kWhiteColor,
            size: 40,
          ),
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
