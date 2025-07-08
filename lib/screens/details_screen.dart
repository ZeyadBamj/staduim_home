import 'package:flutter/material.dart';
import 'package:reservision_app/models/city_model.dart';
import 'package:reservision_app/screens/booking_screen.dart';
import 'package:reservision_app/widgets/common/custom_button.dart';

class DetailsScreen extends StatelessWidget {
  final CityModel playground;

  const DetailsScreen({super.key, required this.playground});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(playground.name), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                playground.image,
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "اكتشف ملعبك المثالي، حيث يجتمع التميز والراحة في بيئة رياضية متكاملة. "
              "يتميز الملعب بأرضية عالية الجودة، وإنارة ليلية مثالية، ومرافق حديثة تضمن تجربة حجز ولعب استثنائية لكل اللاعبين.",
              style: TextStyle(fontSize: 16, height: 1.6),
              textAlign: TextAlign.right,
            ),
            const Spacer(),
            CustomButton(
              text: 'احجز الآن',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return BookingScreen();
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
