import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/cubits/reservision_cubit/reservision_cubit.dart';
import 'package:reservision_app/cubits/reservision_cubit/reservision_state.dart';
import 'package:reservision_app/widgets/common_widgets/custom_app_bar.dart';
import 'package:reservision_app/widgets/common_widgets/my_drawer.dart';
import 'package:reservision_app/widgets/reservision_widgets/reservision_buttons.dart';
import 'package:reservision_app/widgets/reservision_widgets/reservision_card.dart';

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
      drawer: MyDrawer(),
      appBar: CustomAppBar(title: 'حجوزاتي'),
      body: Column(
        children: [
          const ReservisionButtons(),
          Expanded(
            child: BlocBuilder<ReservisionCubit, ReservisionState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.tabBookingModel.length,
                  itemBuilder: (context, index) {
                    return ReservisionCard(
                      booking: state.tabBookingModel[index],
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
