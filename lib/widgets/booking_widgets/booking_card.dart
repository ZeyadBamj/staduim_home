import 'package:flutter/material.dart';
import 'package:reservision_app/constants/constants.dart';

class BookingCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget content;

  const BookingCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: kGreyColor, width: 0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 14, color: kGreyColor),
            ),
            const SizedBox(height: 15),
            content,
          ],
        ),
      ),
    );
  }
}
