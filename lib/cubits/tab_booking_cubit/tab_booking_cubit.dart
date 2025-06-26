import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/cubits/tab_booking_cubit/tab_booking_state.dart';
import 'package:reservision_app/models/tab_booking_model.dart';

class TabBookingCubit extends Cubit<TabBookingState> {
  List<TabBookingModel> tabBookingModel;

  TabBookingCubit(List<TabBookingModel> initialBookings)
    : tabBookingModel = [...initialBookings],
      super(
        TabBookingState(
          selectedCategory: 'القادمة',
          tabBookingModel:
              initialBookings.where((b) => b.status == 'القادمة').toList(),
        ),
      );
  // مثال لشرح [...initialBookings] :
  //       void main() {
  //   final original = [1, 2, 3];
  //   final copy1 = original;
  //   final copy2 = [...original];

  //   copy1[0] = 99;
  //   copy2[1] = 88;

  //   print(original); // [99, 2, 3] ← تأثرت لأنها نفس المرجع
  //   print(copy2);    // [1, 88, 3] ← نسخة منفصلة
  // }

  void selectCategory(String categoryName) {
    final filtered =
        tabBookingModel.where((b) => b.status == categoryName).toList();
    emit(state.copyWith(selectedCategory: categoryName, bookings: filtered));
  }

  void cancelBooking(TabBookingModel booking) {
    // عدّل الحجز إلى "ملغية"
    final updatedBooking = booking.copyWith(status: 'ملغية');

    // أنشئ قائمة جديدة تستبدل هذا الحجز بالحجز المعدل
    final updatedAllBookings =
        tabBookingModel.map((b) {
          if (b == booking) {
            return updatedBooking;
          }
          return b;
        }).toList();

    // حدّث القائمة في الكيوبت حسب الفئة الحالية
    final filtered =
        updatedAllBookings
            .where((b) => b.status == state.selectedCategory)
            .toList();

    tabBookingModel
      ..clear()
      ..addAll(updatedAllBookings);

    // اختصار ل
    // tabBookingModel.clear();
    // tabBookingModel.addAll(updatedAllBookings);

    emit(state.copyWith(bookings: filtered));
  }

  void addNewBooking(TabBookingModel newBooking) {
    final updatedBookings = [...tabBookingModel, newBooking];

    tabBookingModel
      ..clear()
      ..addAll(updatedBookings);

    final filtered =
        updatedBookings
            .where((b) => b.status == state.selectedCategory)
            .toList();

    emit(state.copyWith(bookings: filtered));
  }
}
