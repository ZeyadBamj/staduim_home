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
