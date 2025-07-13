import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/cubits/user_cubits/reservision_cubit/reservision_state.dart';
import 'package:reservision_app/models/user_model/reservision_model.dart';

class ReservisionCubit extends Cubit<ReservisionState> {
  List<ReservisionModel> reservisionModelList;

  ReservisionCubit(List<ReservisionModel> initialBookings)
    : reservisionModelList = [...initialBookings],
      super(
        ReservisionState(
          selectedCategory: 'القادمة',
          reservisionModel:
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
        reservisionModelList.where((b) => b.status == categoryName).toList();
    emit(state.copyWith(selectedCategory: categoryName, bookings: filtered));
  }

  void cancelBooking(ReservisionModel booking, String reason) {
    final now = DateTime.now();
    final cancelDate = now.toIso8601String();

    final updatedBooking = booking.copyWith(
      status: 'ملغية',
      name: '${booking.name} (ملغي)',
      cancelReason: reason,
      cancelDate: cancelDate,
    );

    final updatedAllBookings =
        reservisionModelList.map((b) {
          if (b == booking) return updatedBooking;
          return b;
        }).toList();

    final filtered =
        updatedAllBookings
            .where((b) => b.status == state.selectedCategory)
            .toList();

    reservisionModelList
      ..clear()
      ..addAll(updatedAllBookings);

    emit(state.copyWith(bookings: filtered));
  }

  void addNewBooking(ReservisionModel newBooking) {
    final updatedBookings = [...reservisionModelList, newBooking];

    reservisionModelList
      ..clear()
      ..addAll(updatedBookings);

    final filtered =
        updatedBookings
            .where((b) => b.status == state.selectedCategory)
            .toList();

    emit(state.copyWith(bookings: filtered));
  }

  void autoMoveToPastBookings() {
    final now = DateTime.now();

    final updatedBookings =
        reservisionModelList.map((booking) {
          try {
            final bookingDate = DateTime.parse(booking.date);
            if (booking.status == 'القادمة' && bookingDate.isBefore(now)) {
              return booking.copyWith(status: 'السابقة');
            }
          } catch (_) {
            // تجاهل الخطأ إن لم يكن التاريخ قابلاً للتحويل
          }
          return booking;
        }).toList();

    reservisionModelList
      ..clear()
      ..addAll(updatedBookings);

    final filtered =
        updatedBookings
            .where((b) => b.status == state.selectedCategory)
            .toList();

    emit(state.copyWith(bookings: filtered));
  }
}
