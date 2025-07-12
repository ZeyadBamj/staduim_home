import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/constants/text_style_constants.dart';
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
      appBar: AppBar(
        title: const Text(
          'تفاصيل الحجز',
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<BookingCubit, BookingState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: kPrimaryColor, width: 3),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      booking.image,
                      height: mediaQueryHeight(context, height: 0.3),
                      width: mediaQueryWidth(context, width: 0.94),
                      fit: BoxFit.cover,
                    ),
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
                    Text(
                      'التاريخ: ${formatDate(state.selectedDate)}',
                      style: BookingDetailsStyle.kDetails,
                    ),
                    Text(
                      'اليوم:  ${formatDayName(state.selectedDate)}',
                      style: BookingDetailsStyle.kDetails,
                    ),
                    Text(
                      'حجم الملعب:  ${state.selectedFieldSize}',
                      style: BookingDetailsStyle.kDetails,
                    ),
                    Text(
                      'الوقت:  ${state.selectedPeriod}',
                      style: BookingDetailsStyle.kDetails,
                    ),
                    Text(
                      'السعر:  ${state.totalPrice} ريال',
                      style: BookingDetailsStyle.kDetails,
                    ),
                    Text(
                      'رسالة:  ${state.message}',
                      style: BookingDetailsStyle.kDetails,
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                const SizedBox(height: 24),
                SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      final TextEditingController reasonController =
                          TextEditingController();
                      showConfirmDialog(
                        context,
                        title: 'سبب الإلغاء',
                        content: GestureDetector(
                          behavior:
                              HitTestBehavior
                                  .opaque, // مهم لو تستخدم ScrollView
                          onTap: () {
                            FocusScope.of(context).unfocus();
                          },
                          child: TextField(
                            cursorColor: kBlackColor,
                            maxLines: null,
                            minLines: 1,
                            controller: reasonController,
                            decoration: const InputDecoration(
                              hintText: 'اكتب سبب الإلغاء',
                            ),
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
                    },
                    icon: const Icon(Icons.cancel),
                    style: ElevatedButton.styleFrom(backgroundColor: kRedColor),
                    label: const Text(
                      'إلغاء الحجز',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
