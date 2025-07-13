import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/constants/colors_constants.dart';
import 'package:reservision_app/cubits/user_cubits/profile_cubit/login_status_cubit.dart';
import 'package:reservision_app/widgets/user_widgets/common/common/custom_button.dart';
import 'package:reservision_app/widgets/common/custom_text_field.dart';

class LoginFormScreen extends StatelessWidget {
  const LoginFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginStatusCubit>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "تسجيل الدخول",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(thickness: 2, color: kPrimaryColor),
            const SizedBox(height: 20),
            const CustomTextField(labelText: 'اسم المستخدم أو رقم الجوال'),
            const SizedBox(height: 20),
            const CustomTextField(labelText: 'كلمة المرور', obscureText: true),
            const SizedBox(height: 40),
            CustomButton(
              text: 'دخول',
              onTap: () {
                cubit.logIn();
              },
            ),
          ],
        ),
      ),
    );
  }
}
