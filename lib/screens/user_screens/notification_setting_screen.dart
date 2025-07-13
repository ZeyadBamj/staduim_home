import 'package:flutter/material.dart';
import 'package:reservision_app/constants/colors_constants.dart';

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
      appBar: AppBar(
        title: const Text(
          'إعدادات الإشعارات',
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SwitchListTile(
            activeColor: kPrimaryColor,
            title: const Text('تفعيل كل الإشعارات'),
            value: allNotifications,
            onChanged: (value) {
              setState(() {
                allNotifications = value;
              });
            },
          ),
          SwitchListTile(
            activeColor: kPrimaryColor,
            title: const Text('إشعارات العروض'),
            value: offers,
            onChanged: (value) {
              setState(() {
                offers = value;
              });
            },
          ),
          SwitchListTile(
            activeColor: kPrimaryColor,
            title: const Text('إشعارات الحجوزات'),
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
