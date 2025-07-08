import 'package:flutter/material.dart';

class NotificationSettingsScreen extends StatefulWidget {
  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool allNotifications = true;
  bool offers = true;
  bool bookings = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('إعدادات الإشعارات'), centerTitle: true),
      body: Column(
        children: [
          SwitchListTile(
            title: Text('تفعيل كل الإشعارات'),
            value: allNotifications,
            onChanged: (value) {
              setState(() {
                allNotifications = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('إشعارات العروض'),
            value: offers,
            onChanged: (value) {
              setState(() {
                offers = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('إشعارات الحجوزات'),
            value: bookings,
            onChanged: (value) {
              setState(() {
                bookings = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
