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
                      side: BorderSide(color: kPrimaryColor, width: 1),
                      backgroundColor: isSelected ? kPrimaryColor : kWhiteColor,
                      foregroundColor: isSelected ? kWhiteColor : kPrimaryColor,
                      elevation: isSelected ? 5 : 0,
                      padding: EdgeInsets.symmetric(horizontal: 30),
                    ),
                    onPressed: () {
                      cubit.selectCategory(category);
                    },
                    child: Text(
                      category,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }).toList(),
          ),
        );
      },
    );
  }
}
