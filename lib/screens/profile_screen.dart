import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:reservision_app/screens/login_screen.dart';
import 'package:reservision_app/screens/register_screen.dart';
import 'package:reservision_app/widgets/common/auth_tab.dart';
import 'package:reservision_app/widgets/common/my_drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(),
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: const Text("مرحبا بك"),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: BlocBuilder<AuthCubit, AuthMode>(
              builder: (context, state) {
                return Row(
                  children: [
                    AuthTab(
                      // widget/common/auth_tab.dart
                      title: "تسجيل الدخول",
                      mode: AuthMode.login,
                      currentMode: state,
                      onTap: () => context.read<AuthCubit>().showLogin(),
                    ),
                    VerticalDivider(thickness: 3, color: Colors.red, width: 10),
                    AuthTab(
                      title: "إنشاء حساب",
                      mode: AuthMode.register,
                      currentMode: state,
                      onTap: () => context.read<AuthCubit>().showRegister(),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        body: BlocBuilder<AuthCubit, AuthMode>(
          builder: (context, state) {
            return IndexedStack(
              index: state == AuthMode.login ? 0 : 1,
              children: const [LoginForm(), RegisterForm()],
            );
          },
        ),
      ),
    );
  }
}
