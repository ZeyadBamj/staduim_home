import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/cubits/booking_cubit/booking_cubit.dart';
import 'package:reservision_app/cubits/booking_cubit/booking_state.dart';
import 'package:reservision_app/cubits/reservision_cubit/reservision_cubit.dart';
import 'package:reservision_app/helper/date_function.dart';
import 'package:reservision_app/helper/show_confirm_dialog.dart';
import 'package:reservision_app/helper/media_query.dart';
import 'package:reservision_app/models/reservision_model.dart';

class BookingDetailsScreen extends StatelessWidget {
  final ReservisionModel booking;

  const BookingDetailsScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ReservisionCubit>();
    return Scaffold(
      appBar: AppBar(title: const Text('تفاصيل الحجز'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<BookingCubit, BookingState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    booking.image,
                    height: mediaQueryHeight(context, height: 0.3),
                    width: mediaQueryWidth(context, width: 0.94),
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  booking.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('التاريخ: ${formatDate(state.selectedDate)}'),
                    Text('اليوم:  ${formatDayName(state.selectedDate)}'),
                    Text('حجم الملعب:  ${state.selectedFieldSize}'),
                    Text('الوقت:  ${state.selectedPeriod}'),
                    Text('السعر:  ${state.totalPrice} ريال'),
                    Text('رسالة:  ${state.message}'),
                  ],
                ),
                const SizedBox(height: 24),

                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () {
                    final TextEditingController reasonController =
                        TextEditingController();
                    showConfirmDialog(
                      context,
                      title: 'سبب الإلغاء',
                      content: TextField(
                        cursorColor: kBlackColor,
                        maxLines: null,
                        minLines: 1,
                        controller: reasonController,
                        decoration: const InputDecoration(
                          hintText: 'اكتب سبب الإلغاء',
                        ),
                      ),
                      noText: 'إلغاء',
                      onNo: () => Navigator.pop(context),
                      yesText: 'تأكيد الإلغاء',
                      onYes: () {
                        final reason = reasonController.text.trim();
                        if (reason.isNotEmpty) {
                          cubit.cancelBooking(booking, reason);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        }
                      },
                    );

                    //                     void showCancelDialog(BuildContext context, TabBookingModel booking) {
                    //   final TextEditingController reasonController = TextEditingController();

                    //   showDialog(
                    //     context: context,
                    //     builder:
                    //         (context) => AlertDialog(
                    //           title: const Text('سبب الإلغاء'),
                    //           content: TextField(
                    //             controller: reasonController,
                    //             decoration: const InputDecoration(hintText: 'اكتب سبب الإلغاء'),
                    //           ),
                    //           actions: [
                    //             TextButton(
                    //               onPressed: () => Navigator.pop(context),
                    //               child: const Text('إلغاء'),
                    //             ),
                    //             ElevatedButton(
                    //               onPressed: () {
                    //                 final reason = reasonController.text.trim();
                    //                 if (reason.isNotEmpty) {
                    //                   context.read<TabBookingCubit>().cancelBooking(
                    //                     booking,
                    //                     reason,
                    //                   );
                    //                   Navigator.pop(context);
                    //                   Navigator.pop(context);
                    //                 }
                    //               },
                    //               child: const Text('تأكيد الإلغاء'),
                    //             ),
                    //           ],
                    //         ),
                    //   );
                    // }
                  },
                  icon: const Icon(Icons.cancel),
                  style: ElevatedButton.styleFrom(backgroundColor: kRedColor),
                  label: const Text('إلغاء الحجز'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
