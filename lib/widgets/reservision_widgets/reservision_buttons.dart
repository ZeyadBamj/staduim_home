import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/cubits/reservision_cubit/reservision_cubit.dart';
import 'package:reservision_app/cubits/reservision_cubit/reservision_state.dart';
import 'package:reservision_app/widgets/common_widgets/custom_elevated_button.dart';

class ReservisionButtons extends StatelessWidget {
  const ReservisionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ['القادمة', 'السابقة', 'ملغية'];
    final cubit = context.read<ReservisionCubit>();

    return BlocBuilder<ReservisionCubit, ReservisionState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:
                categories.map((category) {
                  final categoryName = state.selectedCategory == category;
                  return CustomElevatedButton(
                    name: category,
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    isSelected: categoryName,
                    onPressed: () {
                      cubit.selectCategory(category);
                    },
                  );
                }).toList(),
          ),
        );
      },
    );
  }
}
