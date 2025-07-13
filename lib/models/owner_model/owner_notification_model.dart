enum BookingStatus { pending, confirmed, rejected }

class OwnerNotificationModel {
  final String id;
  final String phoneNumber;
  final String userName;
  final DateTime date;
  final String period;
  final String fieldSize;
  final String? message;
  final BookingStatus status;

  OwnerNotificationModel({
    required this.id,
    required this.phoneNumber,
    required this.userName,
    required this.date,
    required this.period,
    required this.fieldSize,
    this.message,
    this.status = BookingStatus.pending,
  });

  OwnerNotificationModel copyWith({BookingStatus? status}) {
    return OwnerNotificationModel(
      id: id,
      userName: userName,
      date: date,
      period: period,
      fieldSize: fieldSize,
      message: message,
      status: status ?? this.status,
      phoneNumber: phoneNumber,
    );
  }
}
