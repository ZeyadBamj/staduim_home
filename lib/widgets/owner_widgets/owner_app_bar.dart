import 'package:flutter/material.dart';
import 'package:reservision_app/constants/images_constants.dart';

class OwnerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OwnerAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
