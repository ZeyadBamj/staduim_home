import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/cubits/booking_cubit/booking_cubit.dart';
import 'package:reservision_app/cubits/booking_cubit/booking_state.dart';
import 'package:reservision_app/helper/date_function.dart';
import 'package:reservision_app/helper/media_query.dart';
import 'package:reservision_app/models/reservision_model.dart';
import 'package:reservision_app/screens/user_screens/booking_details_screen.dart';

class ReservisionCard extends StatelessWidget {
  final ReservisionModel booking;

  const ReservisionCard({super.key, required this.booking});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (booking.status == 'القادمة') {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return BookingDetailsScreen(booking: booking);
              },
            ),
          );
        }
      },
      child: BlocBuilder<BookingCubit, BookingState>(
        builder: (context, state) {
          return Card(
            margin: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(color: kPrimaryColor, width: 2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    booking.image,
                    width: mediaQueryWidth(context, width: 0.95),
                    height: mediaQueryHeight(context, height: 0.23),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        booking.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('التاريخ:  ${formatDate(state.selectedDate)}'),
                          Text('اليوم:  ${formatDayName(state.selectedDate)}'),
                          Text('حجم الملعب:  ${state.selectedFieldSize}'),
                          Text('الوقت:  ${state.selectedPeriod}'),
                          Text('السعر:  ${state.totalPrice} ريال'),
                          if (state.message.isNotEmpty)
                            Text('رسالة: ${state.message}'),
                          const SizedBox(height: 10),

                          if (booking.status == 'ملغية') ...[
                            if (booking.cancelReason != null)
                              Text(
                                'سبب الإلغاء: ${booking.cancelReason}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kRedColor,
                                ),
                              ),
                            if (booking.cancelDate != null)
                              Text(
                                'تاريخ الإلغاء: ${formatTime(DateTime.parse(booking.cancelDate!))}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kRedColor,
                                ),
                              ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
