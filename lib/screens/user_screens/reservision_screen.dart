import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/cubits/user_cubits/reservision_cubit/reservision_cubit.dart';
import 'package:reservision_app/cubits/user_cubits/reservision_cubit/reservision_state.dart';
import 'package:reservision_app/widgets/user_widgets/common/common/custom_app_bar.dart';
import 'package:reservision_app/widgets/user_widgets/common/common/my_drawer.dart';
import 'package:reservision_app/widgets/user_widgets/reservision_widgets/reservision_buttons.dart';
import 'package:reservision_app/widgets/user_widgets/reservision_widgets/reservision_card.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ReservisionCubit>().autoMoveToPastBookings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: const CustomAppBar(title: 'حجوزاتي'),
      body: Column(
        children: [
          const ReservisionButtons(),
          Expanded(
            child: BlocBuilder<ReservisionCubit, ReservisionState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.reservisionModel.length,
                  itemBuilder: (context, index) {
                    return ReservisionCard(
                      booking: state.reservisionModel[index],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
