import 'package:flutter/material.dart';
import 'package:reservision_app/constants/colors_constants.dart';
import 'package:reservision_app/constants/text_style_constants.dart';
import 'package:reservision_app/cubits/owner_cubits/owner_control_cubit/owner_control_cubit.dart';
import 'package:reservision_app/models/owner_model/owner_available_period_model.dart';
import 'package:uuid/uuid.dart';

void showAddPeriodDialog(
  BuildContext context,
  OwnerControlCubit cubit,
  String size, {
  OwnerAvailablePeriodModel? editPeriod,
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
              backgroundColor: kBorderColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: Text(
                editPeriod == null ? 'إضافة فترة' : 'تعديل فترة',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Text("البدء: "),
                      const Spacer(),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Text(
                          startTime?.format(context) ?? "--",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
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
                        child: Text(
                          endTime?.format(context) ?? "--",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
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
                  child: const Text("إلغاء", style: ShowConfirmDialogStyle.kNo),
                ),

                // منطق زر الاضافة او التعديل
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

                    int newStart = startTime!.hour * 60 + startTime!.minute;
                    int newEnd = endTime!.hour * 60 + endTime!.minute;

                    if (newEnd <= newStart) {
                      newEnd += 1440; // عبور منتصف الليل
                    }

                    // if (newEnd <= newStart) {
                    //   messenger.showSnackBar(
                    //     const SnackBar(
                    //       content: Text(
                    //         'وقت الانتهاء يجب أن يكون بعد وقت البدء  ❗',
                    //         style: OwnerControlStyle.kSnackBar,
                    //       ),
                    //       backgroundColor: kGreenColor,
                    //     ),
                    //   );
                    //   return;
                    // }

                    final duration = newEnd - newStart;

                    if (duration < 30) {
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

                    if (duration > 360) {
                      messenger.showSnackBar(
                        const SnackBar(
                          content: Text(
                            'مدة الحجز لا تقل عن 30 دقيقة ولا تزيد عن 6 ساعات❗',
                            style: OwnerControlStyle.kSnackBar,
                          ),
                          backgroundColor: kGreenColor,
                        ),
                      );
                      return;
                    }

                    // ✅ التحقق من عدم التداخل مع فترات أخرى
                    final existingPeriods = cubit.state.periods[size] ?? [];
                    final overlaps = existingPeriods.any((period) {
                      if (editPeriod != null && period.id == editPeriod.id) {
                        return false;
                      }
                      int existingStart =
                          period.startTime.hour * 60 + period.startTime.minute;
                      int existingEnd =
                          period.endTime.hour * 60 + period.endTime.minute;
                      if (existingEnd <= existingStart) existingEnd += 1440;

                      return (newStart < existingEnd) &&
                          (newEnd > existingStart);
                    });

                    if (overlaps) {
                      messenger.showSnackBar(
                        const SnackBar(
                          content: Text(
                            'الفترة الجديدة تتداخل مع فترة أخرى موجودة ❗',
                            style: OwnerControlStyle.kSnackBar,
                          ),
                          backgroundColor: kGreenColor,
                        ),
                      );
                      return;
                    }

                    // ✅ إنشاء الفترة بعد التحقق الكامل
                    final newPeriod = OwnerAvailablePeriodModel(
                      id: editPeriod?.id ?? const Uuid().v4(),
                      startTime: startTime!,
                      endTime: endTime!,
                    );

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
                    style: ShowConfirmDialogStyle.kYes,
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
