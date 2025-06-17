import 'package:flutter/material.dart';
import 'package:reservision_app/constants/app_colors.dart';
import 'package:reservision_app/cubits/city_cubit/city_cubit.dart';
import 'package:reservision_app/cubits/navigation_cubit/navigation_cubit.dart';
import 'package:reservision_app/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavigationCubit()),
        BlocProvider(create: (context) => CityCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          primarySwatch: kGreenColor,
          scaffoldBackgroundColor: kBackgroundLight,
          fontFamily: 'Cairo',
          appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(color: kWhiteColor),
            titleTextStyle: TextStyle(
              color: kWhiteColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo',
            ),
          ),
          // Define other theme properties for consistency
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
