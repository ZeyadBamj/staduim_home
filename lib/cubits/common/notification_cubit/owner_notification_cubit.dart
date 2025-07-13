import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/models/owner_model/owner_notification_model.dart';

class OwnerNotificationCubit extends Cubit<List<OwnerNotificationModel>> {
  OwnerNotificationCubit() : super([]);

  void addNotification(OwnerNotificationModel notification) {
    emit([...state, notification]);
  }

  void updateNotificationStatus(String id, BookingStatus status) {
    final updated =
        state.map((n) {
          if (n.id == id) {
            return n.copyWith(status: status);
          }
          return n;
        }).toList();
    emit(updated);
  }
}
