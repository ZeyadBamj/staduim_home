import 'package:flutter/material.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/screens/home_screen.dart';
import 'package:reservision_app/widgets/common/custom_button.dart';
import 'package:reservision_app/widgets/common/custom_text_field.dart';

class OutRegisterScreen extends StatelessWidget {
  const OutRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // صورة الخلفية
        SizedBox.expand(
          child: Image.asset(kBackgroundImage, fit: BoxFit.cover),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(kBallImage, height: 200),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'إنشاء حساب جديد',
                          style: TextStyle(
                            color: Color(0xff258227),
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 5),

                        const SizedBox(height: 8),
                        CustomTextField(labelText: 'اسم المستخدم'),
                        const SizedBox(height: 10),
                        CustomTextField(labelText: 'رقم الجوال'),
                        const SizedBox(height: 10),
                        CustomTextField(
                          labelText: 'كلمة المرور',
                          obscureText: true,
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          labelText: 'تأكيد كلمة المرور',
                          obscureText: true,
                        ),
                        const SizedBox(height: 16),
                        CustomButton(
                          text: 'تسجيل',
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return HomeScreen();
                                },
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'لديك حساب؟  ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                '  تسجيل الدخول  ',
                                style: TextStyle(
                                  color: Color(0xff258227),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
