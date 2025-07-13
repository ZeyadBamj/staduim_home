import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reservision_app/constants/colors_constants.dart';
import 'package:reservision_app/helper/date_function.dart';

class DateSelectorWidget extends StatelessWidget {
  final DateTime selectedDate;
  final void Function(DateTime) onDateSelected;

  const DateSelectorWidget({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  //اختر التاريخ
  Future<void> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          selectedDate.isBefore(DateTime.now()) ? DateTime.now() : selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2036),
    );
    if (picked != null) {
      final now = DateTime.now();
      final pickedWithTime = DateTime(
        picked.year,
        picked.month,
        picked.day,
        now.hour,
        now.minute,
        now.second,
        now.millisecond,
      );
      onDateSelected(pickedWithTime);

      final difference = picked.difference(now).inDays;

      // رفض إذا تجاوز شهرين (حوالي 60 يوم)
      if (difference > 60) {
        // يمكنك استخدام showDialog أو SnackBar
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('لا يمكنك اختيار تاريخ بعيد أكثر من شهرين من الآن.'),
            backgroundColor: kRedColor,
          ),
        );
        return; // لا تكمل التحديث
      }
    }
  }

  // سهم اليمين
  void backArrow() {
    final minDate = DateTime.now().subtract(const Duration(days: 1));
    final previousDate = selectedDate.subtract(const Duration(days: 1));

    if (!previousDate.isBefore(minDate)) {
      onDateSelected(previousDate);
    }
  }

  // سهم اليسار
  void forwardArrow() {
    onDateSelected(selectedDate.add(const Duration(days: 1)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [kPrimaryColor, kGreenColor]),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: () async {
              await pickDate(context);
            },
            icon: const Icon(
              FontAwesomeIcons.calendarCheck,
              color: kWhiteColor,
            ),
            label: const Text(
              'اختر التاريخ',
              style: TextStyle(color: kWhiteColor, fontSize: 16),
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () => backArrow(),
                icon: const Icon(Icons.arrow_back_ios, color: kWhiteColor),
              ),
              Text(
                formatDateWidget(selectedDate),
                style: const TextStyle(
                  color: kWhiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () => forwardArrow(),
                icon: const Icon(Icons.arrow_forward_ios, color: kWhiteColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
