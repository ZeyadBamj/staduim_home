import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/cubits/profile_cubit/login_status_cubit.dart';
import 'package:reservision_app/screens/personal_profile_screen.dart';
import 'package:reservision_app/widgets/common/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text("تسجيل الدخول", style: TextStyle(fontSize: 20)),
            const Divider(thickness: 2, color: kGreyColor),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: "البريد الإلكتروني أو رقم الجوال",
                border: customOutLineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "كلمة المرور",
                border: customOutLineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'دخول',
              onTap: () {
                context.read<LoginStatusCubit>().logIn();
              },
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder customOutLineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: kWhiteColor),
      borderRadius: BorderRadius.circular(16),
    );
  }
}
