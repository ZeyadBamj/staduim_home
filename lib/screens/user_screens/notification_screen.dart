import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/cubits/notification_cubit/user_notification_cubit.dart';
import 'package:reservision_app/models/user_notification_model.dart';
import 'package:reservision_app/screens/user_screens/notification_setting_screen.dart';
import 'package:reservision_app/widgets/common_widgets/custom_button.dart';
import 'package:reservision_app/widgets/notification_widget/notification_tile.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserNotificationsCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الإشعارات',
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, size: 30),
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationSettingsScreen(),
                  ),
                ),
          ),
        ],
      ),
      body: BlocBuilder<UserNotificationsCubit, List<UserNotificationModel>>(
        builder: (context, notifications) {
          if (notifications.isEmpty) {
            return const Center(
              child: Text(
                'لا توجد إشعارات حالياً',
                style: TextStyle(fontSize: 24),
              ),
            );
          }
          return ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final n = notifications[index];
              return NotificationTile(notification: n);
            },
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: CustomButton(
            text: 'تحديد الكل كمقروء',
            onTap: () {
              cubit.markAllAsRead();
            },
          ),
        ),
      ),
    );
  }
}
