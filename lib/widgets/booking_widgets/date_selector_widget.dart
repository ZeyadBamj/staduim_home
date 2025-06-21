import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:reservision_app/constants/constants.dart';

class DateSelectorWidget extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;

  const DateSelectorWidget({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  String _formatDate(DateTime date) {
    final dayName = DateFormat('EEEE').format(date);
    final day = date.day;
    final month = DateFormat('MMMM').format(date);
    return '$dayName  $day $month';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF4CAF50), Color(0xFF66BB6A)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate:
                    selectedDate.isBefore(DateTime.now())
                        ? DateTime.now()
                        : selectedDate,
                firstDate: DateTime.now(),
                lastDate: DateTime(2030),
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
              }
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
                onPressed: () {
                  final minDate = DateTime.now().subtract(
                    const Duration(days: 1),
                  );
                  final previousDate = selectedDate.subtract(
                    const Duration(days: 1),
                  );

                  if (!previousDate.isBefore(minDate)) {
                    onDateSelected(previousDate);
                  }
                },
                icon: const Icon(Icons.arrow_back_ios, color: kWhiteColor),
              ),
              Text(
                _formatDate(selectedDate),
                style: const TextStyle(
                  color: kWhiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed:
                    () => onDateSelected(
                      selectedDate.add(const Duration(days: 1)),
                    ),
                icon: const Icon(Icons.arrow_forward_ios, color: kWhiteColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
