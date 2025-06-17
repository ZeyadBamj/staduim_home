import 'package:flutter/material.dart';
import 'package:reservision_app/constants/app_colors.dart';
import 'package:reservision_app/widgets/common/custom_button.dart';

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
            CustomButton(text: 'دخول', onTap: () {}),
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
