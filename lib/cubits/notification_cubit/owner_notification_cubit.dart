import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/models/BookingNotification.dart';

class OwnerNotificationCubit extends Cubit<List<BookingNotification>> {
  OwnerNotificationCubit() : super([]);

  void addNotification(BookingNotification notification) {
    emit([...state, notification]);
  }

   void updateNotificationStatus(String id, BookingStatus status) {
    final updated = state.map((n) {
      if (n.id == id) {
        return n.copyWith(status: status);
      }
      return n;
    }).toList();
    emit(updated);
  }
}
