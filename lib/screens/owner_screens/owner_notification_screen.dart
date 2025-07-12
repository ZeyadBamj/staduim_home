import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/cubits/notification_cubit/owner_notification_cubit.dart';
import 'package:reservision_app/models/owner_notification_model.dart';

class OwnerNotificationsScreen extends StatelessWidget {
  const OwnerNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreenColor.shade200,
      appBar: AppBar(
        title: const Text('إشعارات الحجوزات'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
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
              final formattedDate = DateFormat(
                'yyyy-MM-dd',
              ).format(item.date);
    
              // حالة الحجز ولونها
              String statusText;
              Color statusColor;
              switch (item.status) {
                case BookingStatus.confirmed:
                  statusText = "تم التأكيد";
                  statusColor = Colors.green;
                  break;
                case BookingStatus.rejected:
                  statusText = "مرفوض";
                  statusColor = Colors.red;
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
                            backgroundColor: statusColor.withValues(
                              alpha: 0.4,
                            ),
                            labelStyle: TextStyle(color: statusColor),
                          ),
                          if (item.status == BookingStatus.pending)
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<OwnerNotificationCubit>()
                                        .updateNotificationStatus(
                                          item.id,
                                          BookingStatus.confirmed,
                                        );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: kPrimaryColor,
                                  ),
                                  child: const Text("تأكيد"),
                                ),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<OwnerNotificationCubit>()
                                        .updateNotificationStatus(
                                          item.id,
                                          BookingStatus.rejected,
                                        );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: kRedColor,
                                  ),
                                  child: const Text("رفض"),
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
