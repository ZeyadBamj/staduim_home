import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/cubits/booking_cubit/booking_cubit.dart';
import 'package:reservision_app/cubits/booking_cubit/booking_state.dart';
import 'package:reservision_app/helper/date_function.dart';
import 'package:reservision_app/models/tab_booking_model.dart';
import 'package:reservision_app/screens/booking_details_screen.dart';

class TabsBookingCard extends StatelessWidget {
  final TabBookingModel booking;

  const TabsBookingCard({super.key, required this.booking});
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
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  booking.image,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.22,
                  fit: BoxFit.cover,
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
                          Text('رسالة: ${state.message}'),
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
