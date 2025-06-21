import 'package:flutter/material.dart';
import 'package:reservision_app/constants/constants.dart';

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
      leading: Builder(
        builder:
            (context) => IconButton(
              icon: const Icon(Icons.menu, color: kWhiteColor),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
      ),
      title: Text(title),
      backgroundColor: kGreenColor,
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_active, color: kWhiteColor),
          onPressed: onNotification,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
