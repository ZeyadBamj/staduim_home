import 'package:flutter/material.dart';
import 'package:reservision_app/models/user_model/user_notification_model.dart';

class NotificationTile extends StatelessWidget {
  final UserNotificationModel notification;

  const NotificationTile({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: notification.isRead ? Colors.grey[200] : Colors.white,
      title: Text(notification.title),
      subtitle: Text(notification.body),
      trailing: Text(
        timeAgo(notification.timestamp),
        style: TextStyle(fontSize: 12),
      ),
      onTap: () {
        // عرض التفاصيل مثلاً
      },
    );
  }

  String timeAgo(DateTime dt) {
    final diff = DateTime.now().difference(dt);
    if (diff.inMinutes < 60) return '${diff.inMinutes} دقيقة';
    if (diff.inHours < 24) return '${diff.inHours} ساعة';
    return '${diff.inDays} يوم';
  }
}
