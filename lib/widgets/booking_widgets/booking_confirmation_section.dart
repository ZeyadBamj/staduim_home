import 'package:flutter/material.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/helper/custom_border.dart';

class BookingConfirmationSection extends StatelessWidget {
  final double totalPrice;
  final TextEditingController messageController;
  final ValueChanged<String>
  onMessageChanged; // دالة استدعاء جديدة لتحديث الرسالة

  const BookingConfirmationSection({
    super.key,
    required this.totalPrice,
    required this.messageController,
    required this.onMessageChanged, // يجب أن تكون مطلوبة الآن
  });

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: kBlueColor,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: kRedColor,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          'سعر الحجز',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        // عرض سعر حجز الملعب
        SizedBox(
          height: 70,
          child: Card(
            color: kBorderColor,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: kPrimaryColor, width: 2),
            ),
            child: Center(
              child: Text(
                '$totalPrice ريال',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        const Text(
          'أترك رسالتك أو طلبك للملعب',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        // حقل إدخال الرسالة
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          elevation: 5,
          child: TextField(
            controller: messageController,
            maxLines: 3,
            onChanged: onMessageChanged, // استدعاء الدالة عند تغيير النص
            decoration: InputDecoration(
              hintText: 'أكتب هنا ...',
              enabledBorder: customBorder(color: kGreenColor, width: 2),
              focusedBorder: customBorder(color: kPrimaryColor, width: 3),
            ),
          ),
        ),

        const SizedBox(height: 20),
        // معلومات إضافية
        _buildInfoRow('لديك عدد غيابات عن الحجوزات', '0'),
        const SizedBox(height: 10),
        _buildInfoRow('لديك عدد الغاءات للحجوزات', '1'),
      ],
    );
  }
}
