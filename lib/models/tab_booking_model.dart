class TabBookingModel {
  final String name;
  final String date;
  final String day;
  final String time;
  final String price;
  final String status;
  final String image;

  TabBookingModel({
    required this.name,
    required this.date,
    required this.day,
    required this.time,
    required this.price,
    required this.status,
    required this.image,
  });

  TabBookingModel copyWith({
    String? name,
    String? date,
    String? day,
    String? time,
    String? price,
    String? status,
    String? imageUrl,
  }) {
    return TabBookingModel(
      name: name ?? this.name,
      date: date ?? this.date,
      day: day ?? this.day,
      time: time ?? this.time,
      price: price ?? this.price,
      status: status ?? this.status,
      image: imageUrl ?? this.image,
    );
  }
}
