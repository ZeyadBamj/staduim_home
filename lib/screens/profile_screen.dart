import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:reservision_app/cubits/profile_cubit/login_status_cubit.dart';
import 'package:reservision_app/screens/login_screen.dart';
import 'package:reservision_app/screens/personal_profile_screen.dart';
import 'package:reservision_app/screens/register_screen.dart';
import 'package:reservision_app/widgets/common/auth_tab.dart';
import 'package:reservision_app/widgets/common/my_drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
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
                drawer: MyDrawer(),
                appBar: AppBar(
                  title: const Text("مرحبا بك"),
                  centerTitle: true,
                  bottom:
                      isLoggedIn == true
                          ? null
                          : PreferredSize(
                            preferredSize: const Size.fromHeight(50),
                            child: BlocBuilder<AuthCubit, AuthMode>(
                              builder: (context, state) {
                                return Row(
                                  children: [
                                    AuthTab(
                                      title: "تسجيل الدخول",
                                      mode: AuthMode.login,
                                      currentMode: state,
                                      onTap:
                                          () =>
                                              context
                                                  .read<AuthCubit>()
                                                  .showLogin(),
                                    ),
                                    AuthTab(
                                      title: "إنشاء حساب",
                                      mode: AuthMode.register,
                                      currentMode: state,
                                      onTap:
                                          () =>
                                              context
                                                  .read<AuthCubit>()
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

                    return BlocBuilder<AuthCubit, AuthMode>(
                      builder: (context, state) {
                        return IndexedStack(
                          index: state == AuthMode.login ? 0 : 1,
                          children: const [LoginForm(), RegisterForm()],
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
