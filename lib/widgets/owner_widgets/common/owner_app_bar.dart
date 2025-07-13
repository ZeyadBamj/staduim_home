import 'package:flutter/material.dart';
import 'package:reservision_app/constants/images_constants.dart';
import 'package:reservision_app/helper/media_query.dart';

class OwnerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OwnerAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(kBallImage, width: mediaQueryWidth(context, width: 0.12)),
          Text(title),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
