import 'package:flutter/material.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/screens/booking_screen.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("ملعب إنماء الجديدة"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // صورة للملعب (يفضل استخدام صورة فعلية)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  kEnamImage,
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              // الوصف
              const Text(
                "اكتشف ملعب إنماء الجديدة في قلب مدينة عدن، حيث يجتمع التميز والراحة في بيئة رياضية متكاملة. "
                "يتميز الملعب بأرضية عالية الجودة، وإنارة ليلية مثالية، ومرافق حديثة تضمن تجربة حجز ولعب استثنائية لكل اللاعبين.",
                style: TextStyle(fontSize: 16, height: 1.6),
                textAlign: TextAlign.right,
              ),
              const Spacer(),

              // زر الحجز
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return BookingScreen();
                        },
                      ),
                    );
                  },
                  child: const Text("احجز الآن"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
