import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/models/user_notification_model.dart';

class UserNotificationsCubit extends Cubit<List<UserNotificationModel>> {
  UserNotificationsCubit() : super([]);

  /// تحميل إشعارات وهمية (يمكن لاحقًا ربطها بـ Firebase أو قاعدة بيانات)
  void loadNotifications() {
    emit([
      UserNotificationModel(
        id: '1',
        title: 'تم تأكيد الحجز',
        body: 'تم تأكيد حجزك لملعب انماء الجديدة',
        timestamp: DateTime.now().subtract(Duration(minutes: 30)),
      ),
      UserNotificationModel(
        id: '2',
        title: 'عرض جديد!',
        body: 'احصل على خصم 20% عند الحجز اليوم',
        timestamp: DateTime.now().subtract(Duration(hours: 1)),
      ),
    ]);
  }

  /// تحديد إشعار واحد كمقروء
  void markAsRead(String id) {
    emit(
      state.map((n) {
        if (n.id == id) {
          return UserNotificationModel(
            id: n.id,
            title: n.title,
            body: n.body,
            timestamp: n.timestamp,
            isRead: true,
          );
        }
        return n;
      }).toList(),
    );
  }

  /// تحديد جميع الإشعارات كمقروءة
  void markAllAsRead() {
    emit(
      state
          .map(
            (n) => UserNotificationModel(
              id: n.id,
              title: n.title,
              body: n.body,
              timestamp: n.timestamp,
              isRead: true,
            ),
          )
          .toList(),
    );
  }

  /// حذف إشعار واحد
  void deleteNotification(String id) {
    emit(state.where((n) => n.id != id).toList());
  }

  /// حذف جميع الإشعارات
  void clearAll() {
    emit([]);
  }
}
