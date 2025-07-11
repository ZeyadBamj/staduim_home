import 'package:flutter/material.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/helper/media_query.dart';

class UpcomingBookingCard extends StatelessWidget {
  final String fieldName;
  final String imageUrl;

  const UpcomingBookingCard({
    super.key,
    required this.fieldName,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero, // Remove default card margin
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 10,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: kPrimaryColor, width: 2),
          borderRadius: BorderRadius.circular(16),
          color: kWhiteColor,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(15),
                right: Radius.circular(15),
              ),
              child: Image.asset(
                imageUrl,
                width: mediaQueryWidth(context, width: 0.4),
                height: mediaQueryHeight(context, height: 0.2),
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) => Container(
                      width: mediaQueryWidth(context, width: 0.4),
                      height: mediaQueryHeight(context, height: 0.2),
                      color: kBorderColor,
                      child: const Icon(Icons.broken_image, color: kGreyColor),
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
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: kBlackColor,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
