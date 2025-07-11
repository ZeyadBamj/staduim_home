import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/constants/text_style_constants.dart';
import 'package:reservision_app/cubits/owner_control_cubit/owner_control_cubit.dart';
import 'package:reservision_app/cubits/owner_control_cubit/owner_control_state.dart';
import 'package:reservision_app/helper/show_confirm_dialog.dart';
import 'package:reservision_app/models/available_period.dart';
import 'package:reservision_app/widgets/booking_widgets/booking_card.dart';
import 'package:reservision_app/widgets/booking_widgets/field_size_selector.dart';
import 'package:reservision_app/widgets/common/owner_app_bar.dart';
import 'package:uuid/uuid.dart';

class OwnerPlaygroundControlScreen extends StatelessWidget {
  const OwnerPlaygroundControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreenColor.shade200,
      appBar: OwnerAppBar(title: 'ادارة الملعب'),
      body: BlocBuilder<OwnerControlCubit, OwnerControlState>(
        builder: (context, state) {
          final cubit = context.read<OwnerControlCubit>();
          final selectedSize = state.selectedSize;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: kPrimaryColor, width: 2),
                  ),
                  color: kGreenColor,
                  elevation: 7,
                  child: BookingCard(
                    title: 'اختر حجم الملعب :',
                    subtitle: 'لكل حجم سعر وفترات مستقلة',
                    content: FieldSizeSelector(
                      selectedSize: selectedSize,
                      onSizeSelected: (size) {
                        cubit.selectSize(size);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                if (selectedSize == null)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Text(
                        "اختر حجم الملعب الذي تريده",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                else
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),

                      const Text(
                        "الفترات المتاحة :",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),

                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.periods[selectedSize]?.length ?? 0,
                        itemBuilder: (context, index) {
                          final period = state.periods[selectedSize]![index];
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color: kPrimaryColor, width: 1),
                            ),
                            elevation: 5,
                            margin: EdgeInsets.symmetric(vertical: 8),
                            child: ListTile(
                              title: Directionality(
                                textDirection: TextDirection.ltr,
                                child: Text(
                                  "${period.endTime.format(context)} - ${period.startTime.format(context)}",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.edit,
                                      color: kBlueColor,
                                      size: 32,
                                    ),
                                    onPressed:
                                        () => _showPeriodDialog(
                                          context,
                                          cubit,
                                          selectedSize,
                                          editPeriod: period,
                                        ),
                                  ),

                                  const SizedBox(width: 10),

                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: kRedColor,
                                      size: 32,
                                    ),
                                    onPressed: () async {
                                      final deletePeriod = await showConfirmDialog(
                                        context,
                                        title: 'حذف الفترة',
                                        content:
                                            'هل أنت متأكد أنك تريد حذف هذه الفترة؟',
                                        noText: 'لا',
                                        onNo: () {
                                          Navigator.of(context).pop(false);
                                        },
                                        yesText: 'نعم',
                                        onYes: () {
                                          Navigator.of(context).pop(true);
                                        },
                                      );
                                      if (deletePeriod == true) {
                                        cubit.deletePeriod(
                                          selectedSize,
                                          period.id,
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: ElevatedButton.icon(
                            onPressed:
                                () => _showPeriodDialog(
                                  context,
                                  cubit,
                                  selectedSize,
                                ),
                            icon: const Icon(FontAwesomeIcons.plus),
                            label: const Text(
                              "   إضافة فترة جديدة   ",
                              style: OwnerControlStyle.kSnackBar,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 50),
                      // السعر
                      Text(
                        'السعر :',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        cursorColor: kBlackColor,
                        controller: TextEditingController(
                          text:
                              state.pricePerHour[selectedSize]?.toString() ??
                              '',
                        ),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'سعر الساعة الواحدة بـ(ر.ي)',
                          labelStyle: TextStyle(
                            color: kBlackColor,
                            fontWeight: FontWeight.bold,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: kGreenColor,
                              width: 3,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: kPrimaryColor,
                              width: 4,
                            ),
                          ),
                        ),
                        onSubmitted: (value) {
                          final price = double.tryParse(value);
                          if (price != null) {
                            cubit.setPriceForSize(selectedSize, price);
                          }
                        },
                      ),
                      const SizedBox(height: 50),
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(FontAwesomeIcons.penToSquare),
                            label: const Text(
                              "  تثبيت   ",
                              style: OwnerControlStyle.kSnackBar,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showPeriodDialog(
    BuildContext context,
    OwnerControlCubit cubit,
    String size, {
    AvailablePeriod? editPeriod,
  }) {
    TimeOfDay? startTime = editPeriod?.startTime;
    TimeOfDay? endTime = editPeriod?.endTime;

    showDialog(
      context: context,
      builder: (_) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                title: Text(editPeriod == null ? 'إضافة فترة' : 'تعديل فترة'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const Text("البدء: "),
                        const Spacer(),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: Text(startTime?.format(context) ?? "--"),
                        ),
                        TextButton(
                          onPressed: () async {
                            final picked = await showTimePicker(
                              context: context,
                              initialTime: startTime ?? TimeOfDay.now(),
                            );
                            if (picked != null) {
                              setState(() => startTime = picked);
                            }
                          },
                          child: const Text(
                            "اختر",
                            style: OwnerControlStyle.kAddPeriod,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("الانتهاء: "),
                        const Spacer(),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: Text(endTime?.format(context) ?? "--"),
                        ),
                        TextButton(
                          onPressed: () async {
                            final picked = await showTimePicker(
                              context: context,
                              initialTime: endTime ?? TimeOfDay.now(),
                            );
                            if (picked != null) {
                              setState(() => endTime = picked);
                            }
                          },
                          child: const Text(
                            "اختر",
                            style: OwnerControlStyle.kAddPeriod,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "إلغاء",
                      style: OwnerControlStyle.kAddPeriod,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      final messenger = ScaffoldMessenger.of(context);

                      // التحقق من عدم اختيار وقت البدء
                      if (startTime == null) {
                        messenger.showSnackBar(
                          const SnackBar(
                            content: Text(
                              'الرجاء اختيار وقت البدء  ❗',
                              style: OwnerControlStyle.kSnackBar,
                            ),
                            backgroundColor: kGreenColor,
                          ),
                        );
                        return;
                      }

                      // التحقق من عدم اختيار وقت الانتهاء
                      if (endTime == null) {
                        messenger.showSnackBar(
                          const SnackBar(
                            content: Text(
                              'الرجاء اختيار وقت الانتهاء  ❗',
                              style: OwnerControlStyle.kSnackBar,
                            ),
                            backgroundColor: kGreenColor,
                          ),
                        );
                        return;
                      }

                      // التحقق من أن وقت الانتهاء بعد وقت البدء
                      final startMinutes =
                          startTime!.hour * 60 + startTime!.minute;
                      final endMinutes = endTime!.hour * 60 + endTime!.minute;

                      if (endMinutes <= startMinutes) {
                        messenger.showSnackBar(
                          const SnackBar(
                            content: Text(
                              'وقت الانتهاء يجب أن يكون بعد وقت البدء  ❗',
                              style: OwnerControlStyle.kSnackBar,
                            ),
                            backgroundColor: kGreenColor,
                          ),
                        );
                        return;
                      }

                      if ((endMinutes - startMinutes) < 30) {
                        messenger.showSnackBar(
                          const SnackBar(
                            content: Text(
                              'يجب أن تكون المدة على الأقل 30 دقيقة ❗',
                              style: OwnerControlStyle.kSnackBar,
                            ),
                            backgroundColor: kGreenColor,
                          ),
                        );
                        return;
                      }

                      final newPeriod = AvailablePeriod(
                        id: editPeriod?.id ?? const Uuid().v4(),
                        startTime: startTime!,
                        endTime: endTime!,
                      );

                      final cubit = context.read<OwnerControlCubit>();
                      if (editPeriod == null) {
                        cubit.addPeriod(cubit.state.selectedSize!, newPeriod);
                      } else {
                        cubit.updatePeriod(
                          cubit.state.selectedSize!,
                          editPeriod.id,
                          newPeriod,
                        );
                      }

                      Navigator.pop(context);
                    },
                    child: Text(
                      editPeriod == null ? "إضافة" : "حفظ",
                      style: OwnerControlStyle.kAddPeriod,
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
