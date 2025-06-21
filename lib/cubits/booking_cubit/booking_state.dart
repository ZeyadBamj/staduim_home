import 'package:equatable/equatable.dart';

// تمثل BookingState الحالة الكاملة لواجهة حجز الملعب
class BookingState extends Equatable {
  final DateTime selectedDate;
  final String? selectedPlayerCategory;
  final String? selectedFieldSize;
  final String? selectedPeriod;
  final String? selectedPitchNumber;
  final String message;
  final double totalPrice; // يمكن أن يتغير السعر بناءً على الخيارات

  const BookingState({
    required this.selectedDate,
    this.selectedPlayerCategory,
    this.selectedFieldSize,
    this.selectedPeriod,
    this.selectedPitchNumber,
    this.message = '',
    this.totalPrice = 350.0, // سعر افتراضي
  });

  // دالة copyWith لإنشاء حالة جديدة بناءً على الحالة الحالية مع تغييرات محددة
  BookingState copyWith({
    DateTime? selectedDate,
    String? selectedPlayerCategory,
    String? selectedFieldSize,
    String? selectedPeriod,
    String? selectedPitchNumber,
    String? message,
    double? totalPrice,
  }) {
    return BookingState(
      selectedDate: selectedDate ?? this.selectedDate,
      selectedPlayerCategory:
          selectedPlayerCategory ?? this.selectedPlayerCategory,
      selectedFieldSize: selectedFieldSize ?? this.selectedFieldSize,
      selectedPeriod: selectedPeriod ?? this.selectedPeriod,
      selectedPitchNumber: selectedPitchNumber ?? this.selectedPitchNumber,
      message: message ?? this.message,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  @override
  List<Object?> get props => [
    selectedDate,
    selectedPlayerCategory,
    selectedFieldSize,
    selectedPeriod,
    selectedPitchNumber,
    message,
    totalPrice,
  ];
}
