import 'package:flutter/material.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/cubits/booking_cubit/booking_cubit.dart';
import 'package:reservision_app/cubits/city_cubit/city_cubit.dart';
import 'package:reservision_app/cubits/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:reservision_app/cubits/notification_cubit/notification_cubit.dart';
import 'package:reservision_app/cubits/available_periods_cubit/available_periods_cubit.dart';
import 'package:reservision_app/cubits/notification_cubit/owner_notification_cubit.dart';
import 'package:reservision_app/cubits/owner_control_cubit/owner_control_cubit.dart';
import 'package:reservision_app/cubits/profile_cubit/profile_cubit.dart';
import 'package:reservision_app/cubits/tab_booking_cubit/tab_booking_cubit.dart';
import 'package:reservision_app/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/screens/notification_screen.dart';
import 'package:reservision_app/screens/out_login_screen.dart';
import 'package:reservision_app/screens/owner_control_screen.dart';
import 'package:reservision_app/screens/owner_home.dart';
import 'package:reservision_app/screens/owner_notification_screen.dart';
import 'package:reservision_app/screens/personal_profile_screen.dart';
import 'package:reservision_app/widgets/auth_gate.dart';
import 'package:reservision_app/widgets/tab_booking_widgets/mock_bookings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavigationCubit()),
        BlocProvider(create: (context) => CityCubit()),
        BlocProvider(create: (context) => BookingCubit()),
        BlocProvider(create: (context) => TabBookingCubit(mockBookings)),
        BlocProvider(create: (context) => ProfileCubit()),
        BlocProvider(create: (context) => NotificationsCubit()),
        BlocProvider(create: (context) => OwnerControlCubit()),
        BlocProvider(create: (context) => OwnerNotificationCubit()),
      ],
      child: MaterialApp(
        locale: const Locale('ar'),
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: child!,
          );
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          scaffoldBackgroundColor: kWhiteColor,
          fontFamily: 'Cairo',
          appBarTheme: const AppBarTheme(
            color: kPrimaryColor,
            elevation: 0,
            // iconTheme: IconThemeData(color: kWhiteColor),
            titleTextStyle: TextStyle(
              color: kWhiteColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo',
            ),
          ),

          // Define other theme properties for consistency
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              foregroundColor: kWhiteColor,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        home: const OwnerHome(),
      ),
    );
  }
}
