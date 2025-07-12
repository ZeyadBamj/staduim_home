import 'package:reservision_app/models/reservision_model.dart';

class ReservisionState {
  final String selectedCategory;
  final List<ReservisionModel> tabBookingModel;

  ReservisionState({
    required this.selectedCategory,
    required this.tabBookingModel,
  });

  ReservisionState copyWith({
    String? selectedCategory,
    List<ReservisionModel>? bookings,
  }) {
    return ReservisionState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      tabBookingModel: bookings ?? this.tabBookingModel,
    );
  }
}
