import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reservision_app/constants/colors_constants.dart';
import 'package:reservision_app/cubits/common/notification_cubit/owner_notification_cubit.dart';
import 'package:reservision_app/models/owner_model/owner_notification_model.dart';

void addFakeNotifications(BuildContext context) {
  final cubit = context.read<OwnerNotificationCubit>();

  cubit.addNotification(
    OwnerNotificationModel(
      id: '1',
      userName: 'أحمد محمد',
      phoneNumber: '83048340384',
      date: DateTime.now(),
      period: '5:00 م - 6:00 م',
      fieldSize: 'صغير',
      message: 'يرجى تجهيز الملعب مسبقًا',
    ),
  );

  cubit.addNotification(
    OwnerNotificationModel(
      id: '2',
      phoneNumber: '83048340384',
      userName: 'سارة علي',
      date: DateTime.now().add(const Duration(days: 1)),
      period: '4:00 م - 5:00 م',
      fieldSize: 'كبير',
    ),
  );

  cubit.addNotification(
    OwnerNotificationModel(
      id: '3',
      phoneNumber: '83048340384',
      userName: 'محمد سعيد',
      date: DateTime.now().add(const Duration(days: 2)),
      period: '6:00 م - 7:00 م',
      fieldSize: 'متوسط',
      message: 'أرجو إضافة ماء للملعب',
    ),
  );
}

ElevatedButton customElevatedButton(
  OwnerNotificationCubit cubit,
  OwnerNotificationModel item, {
  required BookingStatus bookingStatus,
  required Color color,
  required String text,
}) {
  return ElevatedButton(
    onPressed: () {
      cubit.updateNotificationStatus(item.id, bookingStatus);
    },
    style: ElevatedButton.styleFrom(backgroundColor: color),
    child: Text(text),
  );
}

class OwnerNotificationsScreen extends StatelessWidget {
  const OwnerNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OwnerNotificationCubit>();
    return Scaffold(
      backgroundColor: kGreenColor.shade200,
      appBar: AppBar(
        title: const Text('إشعارات الحجوزات'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 30),
            tooltip: "إضافة إشعارات وهمية",
            onPressed: () => addFakeNotifications(context),
          ),
        ],
      ),
      body: BlocBuilder<OwnerNotificationCubit, List<OwnerNotificationModel>>(
        builder: (context, notifications) {
          if (notifications.isEmpty) {
            return const Center(
              child: Text(
                "لا توجد إشعارات حالياً...",
                style: TextStyle(fontSize: 32),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final item = notifications[index];
              final formattedDate = DateFormat('yyyy-MM-dd').format(item.date);

              // حالة الحجز ولونها
              String statusText;
              Color statusColor;
              switch (item.status) {
                case BookingStatus.confirmed:
                  statusText = "تم التأكيد";
                  statusColor = kGreenColor;
                  break;
                case BookingStatus.rejected:
                  statusText = "مرفوض";
                  statusColor = kRedColor;
                  break;
                default:
                  statusText = "غير مؤكدة";
                  statusColor = kOrangeColor;
              }

              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: kPrimaryColor, width: 2),
                ),
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "🚨 حجز جديد من ${item.userName}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "☎️ رقم الجوال: ${item.phoneNumber}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      Text("📅 التاريخ: $formattedDate"),
                      Text("🏟️ الحجم: ${item.fieldSize}"),
                      Text("⏰ الفترة: ${item.period}"),
                      if (item.message != null && item.message!.isNotEmpty)
                        Text("📩 ملاحظة: ${item.message}"),
                      const SizedBox(height: 12),

                      // الحالة
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Chip(
                            label: Text(statusText),
                            backgroundColor: statusColor.withValues(alpha: 0.4),
                            labelStyle: TextStyle(color: statusColor),
                          ),
                          if (item.status == BookingStatus.pending)
                            Row(
                              children: [
                                customElevatedButton(
                                  cubit,
                                  item,
                                  bookingStatus: BookingStatus.confirmed,
                                  color: kPrimaryColor,
                                  text: 'تأكيد',
                                ),
                                const SizedBox(width: 10),
                                customElevatedButton(
                                  cubit,
                                  item,
                                  bookingStatus: BookingStatus.rejected,
                                  color: kRedColor,
                                  text: 'رفض',
                                ),
                              ],
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
