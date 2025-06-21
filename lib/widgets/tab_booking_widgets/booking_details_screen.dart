import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/cubits/tab_booking_cubit/tab_booking_cubit.dart';
import 'package:reservision_app/models/tab_booking_model.dart';

class BookingDetailsScreen extends StatelessWidget {
  final TabBookingModel booking;

  const BookingDetailsScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تفاصيل الحجز'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
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
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text('اليوم: ${booking.day}'),
            Text('التاريخ: ${booking.date}'),
            Text('الوقت: ${booking.time}'),
            Text('السعر: ${booking.price}'),
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
                              context.read<TabBookingCubit>().cancelBooking(
                                booking,
                              );
                              Navigator.pop(context); // الرجوع للشاشة السابقة
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('تم إلغاء الحجز')),
                              );
                            },
                            child: const Text('نعم'),
                          ),
                        ],
                      ),
                );
              },
              icon: const Icon(Icons.cancel),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              label: const Text('إلغاء الحجز'),
            ),
          ],
        ),
      ),
    );
  }
}
