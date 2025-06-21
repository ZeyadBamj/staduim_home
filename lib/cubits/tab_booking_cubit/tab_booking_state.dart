import 'package:reservision_app/models/tab_booking_model.dart';

class TabBookingState {
  final String selectedCategory;
  final List<TabBookingModel> tabBookingModel;

  TabBookingState({
    required this.selectedCategory,
    required this.tabBookingModel,
  });

  TabBookingState copyWith({
    String? selectedCategory,
    List<TabBookingModel>? bookings,
  }) {
    return TabBookingState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      tabBookingModel: bookings ?? this.tabBookingModel,
    );
  }
}
