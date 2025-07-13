import 'package:flutter/material.dart';
import 'package:reservision_app/constants/colors_constants.dart';
import 'package:reservision_app/cubits/user_cubits/booking_cubit/booking_cubit.dart';
import 'package:reservision_app/cubits/user_cubits/playground_cubit/playground_cubit.dart';
import 'package:reservision_app/cubits/user_cubits/home_cubit/home_cubit.dart';
import 'package:reservision_app/cubits/common/notification_cubit/owner_notification_cubit.dart';
import 'package:reservision_app/cubits/owner_cubits/owner_control_cubit/owner_control_cubit.dart';
import 'package:reservision_app/cubits/user_cubits/personal_profile_cubit/personal_profile_cubit.dart';
import 'package:reservision_app/cubits/user_cubits/reservision_cubit/reservision_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/screens/common/out_login_screen.dart';
import 'package:reservision_app/screens/owner_screens/owner_home.dart';
import 'package:reservision_app/screens/user_screens/user_home.dart';
import 'package:reservision_app/widgets/user_widgets/reservision_widgets/mock_bookings.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ar', null); // أو 'en' أو أي لغة تستخدمها

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => PlaygroundCubit()),
        BlocProvider(create: (context) => BookingCubit()),
        BlocProvider(create: (context) => ReservisionCubit(mockBookings)),
        BlocProvider(create: (context) => PersonalProfileCubit()),
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

        home: const OutLoginScreen(),
      ),
    );
  }
}
