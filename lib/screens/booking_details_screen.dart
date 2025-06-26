import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/cubits/booking_cubit/booking_cubit.dart';
import 'package:reservision_app/cubits/booking_cubit/booking_state.dart';
import 'package:reservision_app/cubits/tab_booking_cubit/tab_booking_cubit.dart';
import 'package:reservision_app/helper/date_function.dart';
import 'package:reservision_app/models/tab_booking_model.dart';

class BookingDetailsScreen extends StatelessWidget {
  final TabBookingModel booking;

  const BookingDetailsScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TabBookingCubit>();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('تفاصيل الحجز'), centerTitle: true),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<BookingCubit, BookingState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    booking.image,
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
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
                      showDialog(
                        context: context,
                        builder:
                            (_) => AlertDialog(
                              title: const Text('تأكيد الإلغاء'),
                              content: const Text(
                                'هل أنت متأكد أنك تريد إلغاء هذا الحجز؟',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('لا'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context); // إغلاق الـ Dialog
                                    cubit.cancelBooking(booking);
                                    Navigator.pop(
                                      context,
                                    ); // الرجوع للشاشة السابقة
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('تم إلغاء الحجز'),
                                      ),
                                    );
                                  },
                                  child: const Text('نعم'),
                                ),
                              ],
                            ),
                      );
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
      ),
    );
  }
}
