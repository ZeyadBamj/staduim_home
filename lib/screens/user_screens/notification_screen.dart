import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/cubits/notification_cubit/notification_cubit.dart';
import 'package:reservision_app/models/notification_model.dart';
import 'package:reservision_app/screens/user_screens/notification_setting_screen.dart';
import 'package:reservision_app/widgets/notification_widget/notification_tile.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الإشعارات'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => NotificationSettingsScreen(),
                  ),
                ),
          ),
        ],
      ),
      body: BlocBuilder<NotificationsCubit, List<NotificationModel>>(
        builder: (context, notifications) {
          if (notifications.isEmpty) {
            return Center(child: Text('لا توجد إشعارات حالياً'));
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
          child: ElevatedButton(
            onPressed: () {
              context.read<NotificationsCubit>().markAllAsRead();
            },
            child: Text('تحديد الكل كمقروء'),
          ),
        ),
      ),
    );
  }
}
