import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/cubits/profile_cubit/login_status_cubit.dart';
import 'package:reservision_app/widgets/common/custom_button.dart';
import 'package:reservision_app/widgets/common/custom_text_field.dart';

class RegisterFormScreen extends StatelessWidget {
  const RegisterFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginStatusCubit>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "إنشاء حساب",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(thickness: 2, color: kPrimaryColor),
            const SizedBox(height: 20),
            const CustomTextField(labelText: 'اسم المستخدم'),
            const SizedBox(height: 20),
            const CustomTextField(
              labelText: 'رقم الجوال',
              keyboardType: TextInputType.numberWithOptions(),
            ),
            const SizedBox(height: 20),
            const CustomTextField(labelText: 'كلمة المرور', obscureText: true),
            const SizedBox(height: 20),
            const CustomTextField(
              labelText: 'تأكيد كلمة المرور',
              obscureText: true,
            ),
            const SizedBox(height: 40),
            CustomButton(
              text: 'إنشاء',
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
