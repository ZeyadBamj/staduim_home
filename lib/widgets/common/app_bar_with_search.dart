import 'package:flutter/material.dart';
import 'package:reservision_app/constants/app_text_styles.dart';

class AppBarWithSearch extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onSearchTap;
  final VoidCallback? onProfileTap;
  final VoidCallback? onMenuTap;

  const AppBarWithSearch({
    super.key,
    required this.title,
    this.onSearchTap,
    this.onProfileTap,
    this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.white),
        onPressed: onMenuTap,
      ),
      title: Text(title, style: AppTextStyles.appBarTitle),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.person, color: Colors.white),
          onPressed: onProfileTap,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
