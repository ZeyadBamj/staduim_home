import 'package:flutter/material.dart';
import 'package:reservision_app/constants/app_colors.dart';
import 'package:reservision_app/constants/app_text_styles.dart';

class UpcomingBookingCard extends StatelessWidget {
  final String fieldName;
  final String date;
  final String time;
  final String imageUrl;
  final VoidCallback? onTap;

  const UpcomingBookingCard({
    super.key,
    required this.fieldName,
    required this.date,
    required this.time,
    required this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.zero, // Remove default card margin
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 10,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: kWhiteColor,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(15),
                ),
                child: Image.asset(
                  imageUrl,
                  width: 150,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (context, error, stackTrace) => Container(
                        width: 150,
                        height: 100,
                        color: kBorderColor,
                        child: const Icon(
                          Icons.broken_image,
                          color: kGreyColor,
                        ),
                      ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fieldName,
                        style: kCardTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 16,
                            color: kTextLight,
                          ),
                          const SizedBox(width: 5),
                          Text(date, style: kCardSubtitle),
                          const SizedBox(width: 15),
                          Icon(Icons.access_time, size: 16, color: kTextLight),
                          const SizedBox(width: 5),
                          Text(time, style: kCardSubtitle),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
