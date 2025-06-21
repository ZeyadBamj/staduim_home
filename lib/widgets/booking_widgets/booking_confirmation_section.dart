import 'package:flutter/material.dart';
import 'package:reservision_app/constants/constants.dart';

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
        Text(label, style: const TextStyle(fontSize: 16)),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: kGreenColor,
          ),
        ),
      ],
    );
  }

  OutlineInputBorder customOutLineInputBorder({required Color color, double width = 0}) {
    return OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:  BorderSide(color: color, width: width),
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
        Container(
          padding: const EdgeInsets.all(12),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: kBorderColor,
            border: Border.all(color: kGreyColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              '$totalPrice ريال',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kGreenColor,
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
        TextField(
          controller: messageController,
          maxLines: 3,
          onChanged: onMessageChanged, // استدعاء الدالة عند تغيير النص
          decoration: InputDecoration(
            hintText: 'أكتب هنا ...',
            border: customOutLineInputBorder(color: kGreyColor),
            enabledBorder: customOutLineInputBorder(color: kGreyColor),
            focusedBorder: customOutLineInputBorder(color: kGreenColor, width: 2),
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
