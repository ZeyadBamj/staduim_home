import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/cubits/profile_cubit/profile_cubit.dart';
import 'package:reservision_app/cubits/profile_cubit/login_status_cubit.dart';
import 'package:reservision_app/screens/user_screens/login_form_screen.dart';
import 'package:reservision_app/screens/user_screens/personal_profile_screen.dart';
import 'package:reservision_app/screens/user_screens/register_form_screen.dart';
import 'package:reservision_app/widgets/profile_widgets/auth_tab.dart';
import 'package:reservision_app/widgets/common_widgets/my_drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProfileCubit()),
        BlocProvider(create: (_) => LoginStatusCubit()),
      ],
      child: BlocBuilder<LoginStatusCubit, bool?>(
        builder: (context, isLoggedIn) {
          return Builder(
            builder: (context) {
              if (isLoggedIn == null) {
                return const Center(child: CircularProgressIndicator());
              }

              if (isLoggedIn) {
                return const PersonalProfileScreen();
              }
              return Scaffold(
                drawer: const MyDrawer(),
                appBar: AppBar(
                  title: const Text("مرحبا بك"),
                  centerTitle: true,
                  bottom:
                      isLoggedIn == true
                          ? null
                          : PreferredSize(
                            preferredSize: const Size.fromHeight(50),
                            child: BlocBuilder<ProfileCubit, ProfileMode>(
                              builder: (context, state) {
                                return Row(
                                  children: [
                                    AuthTab(
                                      title: "تسجيل الدخول",
                                      mode: ProfileMode.login,
                                      currentMode: state,
                                      onTap:
                                          () =>
                                              context
                                                  .read<ProfileCubit>()
                                                  .showLogin(),
                                    ),
                                    AuthTab(
                                      title: "إنشاء حساب",
                                      mode: ProfileMode.register,
                                      currentMode: state,
                                      onTap:
                                          () =>
                                              context
                                                  .read<ProfileCubit>()
                                                  .showRegister(),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                ),
                body: Builder(
                  builder: (context) {
                    if (isLoggedIn == null) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (isLoggedIn) {
                      return const PersonalProfileScreen();
                    }

                    return BlocBuilder<ProfileCubit, ProfileMode>(
                      builder: (context, state) {
                        return IndexedStack(
                          index: state == ProfileMode.login ? 0 : 1,
                          children: const [
                            LoginFormScreen(),
                            RegisterFormScreen(),
                          ],
                        );
                      },
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
