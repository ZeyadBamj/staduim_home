import 'package:flutter/material.dart';

class OwnerAvailablePeriodModel {
  final String id; // معرف فريد للفترة
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  OwnerAvailablePeriodModel({
    required this.id,
    required this.startTime,
    required this.endTime,
  });

  OwnerAvailablePeriodModel copyWith({
    String? id,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
  }) {
    return OwnerAvailablePeriodModel(
      id: id ?? this.id,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }
}
