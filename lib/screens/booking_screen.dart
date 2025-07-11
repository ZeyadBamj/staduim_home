import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/constants/images_constants.dart';
import 'package:reservision_app/cubits/booking_cubit/booking_cubit.dart';
import 'package:reservision_app/cubits/booking_cubit/booking_state.dart';
import 'package:reservision_app/cubits/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:reservision_app/cubits/tab_booking_cubit/tab_booking_cubit.dart';
import 'package:reservision_app/helper/date_function.dart';
import 'package:reservision_app/helper/showSuccessDialog.dart';
import 'package:reservision_app/models/tab_booking_model.dart';
import 'package:reservision_app/widgets/booking_widgets/booking_card.dart';
import 'package:reservision_app/widgets/booking_widgets/booking_confirmation_section.dart';
import 'package:reservision_app/widgets/booking_widgets/date_selector_widget.dart';
import 'package:reservision_app/widgets/booking_widgets/field_size_selector.dart';
import 'package:reservision_app/widgets/booking_widgets/period_selector.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  // TextEditingController تبقى هنا لإدارة إدخال النص محليًا
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubitOfBottomNavigation = context.read<BottomNavigationCubit>();
    final cubitOfBooking = context.read<BookingCubit>();
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.06,
        title: const Text('حجز', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      // BlocBuilder يستمع إلى التغييرات في BookingCubit
      body: BlocBuilder<BookingCubit, BookingState>(
        builder: (context, state) {
          // تحديث قيمة الـ TextEditingController من حالة Cubit
          _messageController.text = state.message;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // مكوّن اختيار التاريخ
                DateSelectorWidget(
                  selectedDate: state.selectedDate,
                  onDateSelected: (onSelectedDate) {
                    cubitOfBooking.selectDate(onSelectedDate);
                  },
                ),

                const Divider(thickness: 2),
                const SizedBox(height: 10),
                // بطاقة لاختيار حجم الملعب
                BookingCard(
                  title: 'اختر حجم الملعب',
                  subtitle: 'يختلف السعر حسب حجم الملعب.',
                  content: FieldSizeSelector(
                    selectedSize: state.selectedFieldSize,
                    onSizeSelected: (size) {
                      // استدعاء دالة Cubit لتحديث حجم الملعب
                      cubitOfBooking.selectFieldSize(size);
                    },
                  ),
                ),
                const Divider(thickness: 2),
                const SizedBox(height: 10),
                // بطاقة لاختيار الفترة
                BookingCard(
                  title: 'اختر الفترة',
                  subtitle:
                      'اختر أحد الفترات المتاحة\nقد تختلف الفترات حسب حجم الملعب',
                  content: PeriodSelector(
                    selectedPeriod: state.selectedPeriod,
                    onPeriodSelected: (period) {
                      // استدعاء دالة Cubit لتحديث الفترة
                      cubitOfBooking.selectPeriod(period);
                    },
                  ),
                ),
                const Divider(thickness: 2),
                const SizedBox(height: 10),

                // قسم تأكيد الحجز والرسالة
                BookingConfirmationSection(
                  totalPrice: state.totalPrice,
                  messageController: _messageController,
                  onMessageChanged: (message) {
                    // استدعاء دالة Cubit لتحديث الرسالة
                    cubitOfBooking.updateMessage(message);
                  },
                ),
                const Divider(thickness: 2),
                const SizedBox(height: 10),

                // زر تأكيد الحجز
                ElevatedButton(
                  onPressed: () {
                    final tabCubit = context.read<TabBookingCubit>();

                    final newBooking = TabBookingModel(
                      image: kEnamImage, // استخدم الصورة المناسبة
                      name: 'ال', // اسم الملعب
                      status: 'القادمة',
                      date: formatDate(cubitOfBooking.state.selectedDate),
                      day: formatDayName(cubitOfBooking.state.selectedDate),
                      period: cubitOfBooking.state.selectedPeriod.toString(),
                      fieldSize:
                          cubitOfBooking.state.selectedFieldSize.toString(),
                      price: cubitOfBooking.state.totalPrice.toString(),
                    );

                    tabCubit.addNewBooking(newBooking);

                    showSuccessDialog(context);
                    cubitOfBottomNavigation.goTo(2);
                    // قم بإضافة منطق تأكيد الحجز الفعلي هنا (مثلاً: إرسال البيانات إلى API)
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'تأكيد الحجز',
                    style: TextStyle(fontSize: 18, color: kWhiteColor),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          );
        },
      ),
    );
  }
}
