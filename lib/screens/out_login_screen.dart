import 'package:flutter/material.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/constants/images_constants.dart';
import 'package:reservision_app/helper/media_query.dart';
import 'package:reservision_app/screens/home_screen.dart';
import 'package:reservision_app/screens/out_register_screen.dart';
import 'package:reservision_app/widgets/common/custom_button.dart';
import 'package:reservision_app/widgets/common/custom_text_field.dart';

class OutLoginScreen extends StatelessWidget {
  const OutLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // صورة الخلفية
        SizedBox.expand(
          child: Image.asset(kBackgroundImage, fit: BoxFit.cover),
        ),
        Scaffold(
          backgroundColor: kTransparentColor,
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    kBallImage,
                    height: mediaQueryHeight(context, height: 0.24),
                  ),
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
                        Image.asset(
                          kProfileImage,
                          color: kBlackColor,
                          height: mediaQueryHeight(context, height: 0.15),
                        ),
                        const CustomTextField(
                          labelText: 'اسم المتسخدم او رقم الجوال',
                        ),
                        const SizedBox(height: 20),
                       const CustomTextField(
                          labelText: 'كلمة المرور',
                          obscureText: true,
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          text: 'تسجيل الدخول',
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const HomeScreen();
                                },
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'ليس لديك حساب؟ ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const OutRegisterScreen();
                                    },
                                  ),
                                );
                              },
                              child: const Text(
                                '  إنشاء حساب جديد ',
                                style: TextStyle(
                                  color: kPrimaryColor,
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
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
