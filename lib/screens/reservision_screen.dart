import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/cubits/tab_booking_cubit/tab_booking_cubit.dart';
import 'package:reservision_app/cubits/tab_booking_cubit/tab_booking_state.dart';
import 'package:reservision_app/widgets/common/custom_app_bar.dart';
import 'package:reservision_app/widgets/common/my_drawer.dart';
import 'package:reservision_app/widgets/tab_booking_widgets/tabs_booking_buttons.dart';
import 'package:reservision_app/widgets/tab_booking_widgets/tabs_booking_card.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: CustomAppBar(
        title: 'حجوزاتي',
        onNotification: () {
          // Handle profile icon tap
          print('Notification icon tapped!');
        },
      ),
      body: Column(
        children: [
          const TabBookingButtons(),
          Expanded(
            child: BlocBuilder<TabBookingCubit, TabBookingState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.tabBookingModel.length,
                  itemBuilder: (context, index) {
                    return TabsBookingCard(
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
