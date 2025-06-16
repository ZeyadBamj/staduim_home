import 'package:flutter/material.dart';
import 'package:reservision_app/widgets/common/custom_button.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text("إنشاء حساب", style: TextStyle(fontSize: 20)),
            const Divider(thickness: 2, color: Colors.grey),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: "الاسم الكامل",
                border: customOutLineInputBorder(),
              ),
            ),
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
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "تأكيد كلمة المرور",
                border: customOutLineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(text: 'إنشاء', onTap: () {}),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder customOutLineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(16),
    );
  }
}
