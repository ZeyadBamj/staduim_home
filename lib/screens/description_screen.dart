import 'package:flutter/material.dart';
import 'package:reservision_app/models/city_model.dart';
import 'package:reservision_app/screens/booking_screen.dart';

class DescriptionScreen extends StatelessWidget {
  final CityModel playground;

  const DescriptionScreen({super.key, required this.playground});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(playground.name),
          centerTitle: true,
        ),
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
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BookingScreen(),
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
