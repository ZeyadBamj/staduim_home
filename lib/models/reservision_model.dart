class ReservisionModel {
  final String status;
  final String image;
  final String name;
  final String date;
  final String day;
  final String period;
  final String fieldSize;
  final String price;
  final String? message;
  final String? cancelReason;
  final String? cancelDate;

  ReservisionModel({
    this.message,
    required this.status,
    required this.image,
    required this.name,
    required this.date,
    required this.day,
    required this.period,
    required this.fieldSize,
    required this.price,
    this.cancelReason,
    this.cancelDate,
  });

  ReservisionModel copyWith({
    String? status,
    String? imageUrl,
    String? name,
    String? date,
    String? day,
    String? time,
    String? period,
    String? fieldSize,
    String? price,
    String? message,
    String? cancelReason,
    String? cancelDate,
  }) {
    return ReservisionModel(
      status: status ?? this.status,
      image: imageUrl ?? this.image,
      name: name ?? this.name,
      date: date ?? this.date,
      day: day ?? this.day,
      period: period ?? this.period,
      fieldSize: fieldSize ?? this.fieldSize,
      price: price ?? this.price,
      message: message ?? this.message,
      cancelReason: cancelReason ?? this.cancelReason,
      cancelDate: cancelDate ?? this.cancelDate,
    );
  }
}
