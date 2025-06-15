import 'package:flutter/material.dart';

class AppBarWithSearch extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onSearchTap;
  final VoidCallback? onNotification;
  final VoidCallback? onMenuTap;

  const AppBarWithSearch({
    super.key,
    required this.title,
    this.onSearchTap,
    this.onNotification,
    this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: Builder(
        builder:
            (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
      ),
      title: const Text('ملاعبك'),
      backgroundColor: Colors.green,
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_active, color: Colors.white),
          onPressed: onNotification,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
