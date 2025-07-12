import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/constants/images_constants.dart';
import 'package:reservision_app/cubits/booking_cubit/booking_cubit.dart';
import 'package:reservision_app/cubits/booking_cubit/booking_state.dart';
import 'package:reservision_app/cubits/home_cubit/home_cubit.dart';
import 'package:reservision_app/cubits/reservision_cubit/reservision_cubit.dart';
import 'package:reservision_app/helper/date_function.dart';
import 'package:reservision_app/helper/media_query.dart';
import 'package:reservision_app/helper/showSuccessDialog.dart';
import 'package:reservision_app/models/reservision_model.dart';
import 'package:reservision_app/widgets/booking_widgets/booking_card.dart';
import 'package:reservision_app/widgets/booking_widgets/booking_confirmation_section.dart';
import 'package:reservision_app/widgets/booking_widgets/date_selector_widget.dart';
import 'package:reservision_app/widgets/booking_widgets/field_size_selector.dart';
import 'package:reservision_app/widgets/booking_widgets/period_selector.dart';
import 'package:reservision_app/widgets/common_widgets/custom_button.dart';

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
    final cubitHome = context.read<HomeCubit>();
    final cubitBooking = context.read<BookingCubit>();
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        toolbarHeight: mediaQueryHeight(context, height: 0.06),
        title: const Text('حجز', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: BlocBuilder<BookingCubit, BookingState>(
        builder: (context, state) {
          // تحديث قيمة الـ TextEditingController من حالة Cubit
          _messageController.text = state.message;
          return GestureDetector(
            behavior: HitTestBehavior.opaque, // مهم لو تستخدم ScrollView
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // مكوّن اختيار التاريخ
                  DateSelectorWidget(
                    selectedDate: state.selectedDate,
                    onDateSelected: (onSelectedDate) {
                      cubitBooking.selectDate(onSelectedDate);
                    },
                  ),

                  const SizedBox(height: 15),
                  // بطاقة لاختيار حجم الملعب
                  BookingCard(
                    title: 'اختر حجم الملعب',
                    subtitle: 'يختلف السعر حسب حجم الملعب.',
                    content: FieldSizeSelector(
                      selectedSize: state.selectedFieldSize,
                      onSizeSelected: (size) {
                        // استدعاء دالة Cubit لتحديث حجم الملعب
                        cubitBooking.selectFieldSize(size);
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  // بطاقة لاختيار الفترة
                  BookingCard(
                    title: 'اختر الفترة',
                    subtitle:
                        'اختر أحد الفترات المتاحة\nقد تختلف الفترات حسب حجم الملعب',
                    content: PeriodSelector(
                      selectedPeriod: state.selectedPeriod,
                      onPeriodSelected: (period) {
                        // استدعاء دالة Cubit لتحديث الفترة
                        cubitBooking.selectPeriod(period);
                      },
                    ),
                  ),
                  const SizedBox(height: 15),

                  // قسم تأكيد الحجز والرسالة
                  BookingConfirmationSection(
                    totalPrice: state.totalPrice,
                    messageController: _messageController,
                    onMessageChanged: (message) {
                      // استدعاء دالة Cubit لتحديث الرسالة
                      cubitBooking.updateMessage(message);
                    },
                  ),
                  const Divider(thickness: 2, color: kBlackColor),
                  const SizedBox(height: 15),

                  // زر تأكيد الحجز
                  CustomButton(
                    text: 'تأكيد الحجز',
                    onTap: () {
                      final tabCubit = context.read<ReservisionCubit>();

                      final newBooking = ReservisionModel(
                        image: kEnamImage, // استخدم الصورة المناسبة
                        name: 'ال', // اسم الملعب
                        status: 'القادمة',
                        date: formatDate(cubitBooking.state.selectedDate),
                        day: formatDayName(cubitBooking.state.selectedDate),
                        period: cubitBooking.state.selectedPeriod.toString(),
                        fieldSize:
                            cubitBooking.state.selectedFieldSize.toString(),
                        price: cubitBooking.state.totalPrice.toString(),
                      );

                      showSuccessDialog(context);
                      tabCubit.addNewBooking(newBooking);
                      cubitHome.goTo(2);
                      // قم بإضافة منطق تأكيد الحجز الفعلي هنا (مثلاً: إرسال البيانات إلى API)
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
