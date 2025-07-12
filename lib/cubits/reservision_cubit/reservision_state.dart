import 'package:reservision_app/models/reservision_model.dart';

class ReservisionState {
  final String selectedCategory;
  final List<ReservisionModel> reservisionModel;

  ReservisionState({
    required this.selectedCategory,
    required this.reservisionModel,
  });

  ReservisionState copyWith({
    String? selectedCategory,
    List<ReservisionModel>? bookings,
  }) {
    return ReservisionState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      reservisionModel: bookings ?? this.reservisionModel,
    );
  }
}
