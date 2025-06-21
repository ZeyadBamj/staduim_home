import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/cubits/tab_booking_cubit/tab_booking_cubit.dart';
import 'package:reservision_app/cubits/tab_booking_cubit/tab_booking_state.dart';

class TabBookingButtons extends StatelessWidget {
  const TabBookingButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ['القادمة', 'السابقة', 'ملغية'];
    final cubit = context.read<TabBookingCubit>();

    return BlocBuilder<TabBookingCubit, TabBookingState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:
                categories.map((category) {
                  final isSelected = state.selectedCategory == category;
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isSelected ? kWhiteColor : kGreenColor,
                      foregroundColor: isSelected ? kGreenColor : kWhiteColor,
                      elevation: isSelected ? 5 : 0,
                    ),
                    onPressed: () {
                      cubit.selectCategory(category);
                    },
                    child: Text(category),
                  );
                }).toList(),
          ),
        );
      },
    );
  }
}
