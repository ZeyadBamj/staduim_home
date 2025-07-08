import 'package:flutter/material.dart';

class AvailablePeriod {
  final String id; // معرف فريد للفترة
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  AvailablePeriod({
    required this.id,
    required this.startTime,
    required this.endTime,

  });

  AvailablePeriod copyWith({
    String? id,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
  }) {
    return AvailablePeriod(
      id: id ?? this.id,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }
}
