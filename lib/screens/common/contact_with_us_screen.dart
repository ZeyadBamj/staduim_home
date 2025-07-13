import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reservision_app/constants/colors_constants.dart';
import 'package:reservision_app/constants/images_constants.dart';

class ContactWithUsScreen extends StatelessWidget {
  const ContactWithUsScreen({super.key});

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
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                'إذا كان لديك استفسار أو مشكلة، فلا تتردد في التواصل معنا عبر الوسائل التالية: \n\n',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Icon(FontAwesomeIcons.envelopeOpenText, size: 50),
            Text(
              'malabekbooking@gmail.com',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Icon(FontAwesomeIcons.mobileScreen, size: 50),
            Text(
              '770394997\n'
              '774687801\n'
              '779957677',
              style: TextStyle(
                fontSize: 24,
                letterSpacing: 7,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
