import 'package:flutter/material.dart';
import 'package:reservision_app/constants/colors_constants.dart';
import 'package:reservision_app/constants/images_constants.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('عن التطبيق'), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Center(
              child: Image.asset(
                kBallImage,
                color: kPrimaryColor,
                height: 150,
                width: 150,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                'تطبيق "ملعب" هو منصة متخصصة لحجز ملاعب كرة القدم والمنشأت الرياضية بكل سهولة،'
                'حيث يمكنك من خلاله: \n'
                '⚽استعراض الملاعب القريبة.\n'
                '⚽معرفة الاسعار والمواعيد المتاحة.\n'
                '⚽إجراء حجز مباشرة من التطبيق.\n'
                '⚽خيارات متعددة للدفع عن طريق: \n'
                '1-الدفع الإلكتروني.\n'
                '2-الدفع عن طريق التحويل لحساب صاحب الملعب.\n'
                '3-الدفع عند الحضور خلال ساعة من الحجز.\n\n\n'
                'هدفنا هو:\n 1-تسهيل عميلة الحجز للمستخدمين وتنطيم أوقات اللعب للأفراد والفرق الرياضية.\n'
                '2-تنظيم الحجوزات لأصحاب الملاعب.',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
