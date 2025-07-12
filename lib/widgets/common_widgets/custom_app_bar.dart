import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/constants/images_constants.dart';
import 'package:reservision_app/cubits/notification_cubit/user_notification_cubit.dart';
import 'package:reservision_app/helper/media_query.dart';
import 'package:reservision_app/screens/user_screens/notification_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(kBallImage, width: mediaQueryWidth(context, width: 0.12)),
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
                  return BlocProvider(
                    create: (context) => UserNotificationsCubit(),
                    child: NotificationsScreen(),
                  );
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
