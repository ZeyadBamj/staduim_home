import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reservision_app/constants/colors_constants.dart';
import 'package:reservision_app/constants/text_style_constants.dart';
import 'package:reservision_app/cubits/owner_cubits/owner_control_cubit/owner_control_cubit.dart';
import 'package:reservision_app/cubits/owner_cubits/owner_control_cubit/owner_control_state.dart';
import 'package:reservision_app/helper/custom_border.dart';
import 'package:reservision_app/helper/media_query.dart';
import 'package:reservision_app/widgets/owner_widgets/owner_control_widgets/show_add_period_dialog.dart';
import 'package:reservision_app/helper/show_confirm_dialog.dart';
import 'package:reservision_app/widgets/user_widgets/booking_widgets/booking_card.dart';
import 'package:reservision_app/widgets/user_widgets/booking_widgets/field_size_selector.dart';
import 'package:reservision_app/widgets/owner_widgets/common/owner_app_bar.dart';

class OwnerPlaygroundControlScreen extends StatelessWidget {
  const OwnerPlaygroundControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus(); // ← يخفي لوحة المفاتيح ويزيل التركيز
      },
      child: Scaffold(
        backgroundColor: kBorderColor,
        appBar: const OwnerAppBar(title: 'ادارة الملعب'),
        body: BlocBuilder<OwnerControlCubit, OwnerControlState>(
          builder: (context, state) {
            final cubit = context.read<OwnerControlCubit>();
            final selectedSize = state.selectedSize;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BookingCard(
                    title: 'اختر حجم الملعب :',
                    subtitle: 'لكل حجم سعر وفترات مستقلة',
                    content: FieldSizeSelector(
                      selectedSize: selectedSize,
                      onSizeSelected: (size) {
                        cubit.selectSize(size);
                      },
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
                                side: const BorderSide(
                                  color: kPrimaryColor,
                                  width: 1,
                                ),
                              ),
                              elevation: 5,
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: ListTile(
                                title: Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Text(
                                    "${period.endTime.format(context)} - ${period.startTime.format(context)}",
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(
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
                                          () => showAddPeriodDialog(
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
                                        final deletePeriod =
                                            await showConfirmDialog(
                                              context,
                                              title: 'حذف الفترة',
                                              content: const Text(
                                                'هل أنت متأكد أنك تريد حذف هذه الفترة؟',
                                              ),
                                              noText: 'لا',
                                              onNo: () {
                                                Navigator.of(
                                                  context,
                                                ).pop(false);
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
                            width: mediaQueryWidth(context, width: 0.7),
                            child: ElevatedButton.icon(
                              onPressed:
                                  () => showAddPeriodDialog(
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
                        const Text(
                          'السعر :',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                            side: BorderSide(color: kGreenColor),
                          ),
                          child: TextField(
                            cursorColor: kBlackColor,
                            controller: TextEditingController(
                              text:
                                  state.pricePerHour[selectedSize]
                                      ?.toString() ??
                                  '',
                            ),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'سعر الساعة الواحدة بـ(ر.ي)',
                              enabledBorder: customBorder(
                                color: kPrimaryColor,
                                width: 2,
                              ),
                              focusedBorder: customBorder(
                                color: kPrimaryColor,
                                width: 3,
                              ),
                            ),
                            onSubmitted: (value) {
                              final price = double.tryParse(value);
                              if (price != null) {
                                cubit.setPriceForSize(selectedSize, price);
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 50),
                        Center(
                          child: SizedBox(
                            width: mediaQueryWidth(context, width: 0.4),
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
      ),
    );
  }
}
