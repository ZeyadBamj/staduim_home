import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  final day = date.day;
  final month = DateFormat('MM').format(date);
  final year = DateFormat('y').format(date);
  return '$year - $month - $day';
}

String formatDayName(DateTime date) {
  final dayName = DateFormat('EEEE').format(date);
  return dayName;
}

String formatTime(DateTime dateTime) {
  return DateFormat.jm('ar').format(dateTime); // مثال: 2:35 م
}

String formatDateWidget(DateTime date) {
  final dayName = DateFormat('EEEE').format(date);
  final day = date.day;
  final month = DateFormat('MMMM').format(date);
  return '$dayName  $day $month';
}

  // Future<void> pickDate(BuildContext context) async {
  //    DateTime? selectedDate;
  //    Function(DateTime)? onDateSelected;
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate:
  //         selectedDate!.isBefore(DateTime.now())
  //             ? DateTime.now()
  //             : selectedDate,
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime(2030),
  //   );
  //   if (picked != null) {
  //     final now = DateTime.now();
  //     final pickedWithTime = DateTime(
  //       picked.year,
  //       picked.month,
  //       picked.day,
  //       now.hour,
  //       now.minute,
  //       now.second,
  //       now.millisecond,
  //     );
  //     onDateSelected!(pickedWithTime);
  //   }
  // }
  