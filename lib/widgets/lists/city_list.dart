import 'package:flutter/material.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/models/city_model.dart';

class CityList extends StatelessWidget {
  final List<CityModel> cityModel;

  const CityList({super.key, required this.cityModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cityModel.length,
      itemBuilder: (context, index) {
        final playGround = cityModel[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.asset(
                  playGround.image,
                  height: MediaQuery.of(context).size.height * 0.23,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    const Icon(Icons.sports_soccer, color: kGreenColor),
                    const SizedBox(width: 8),
                    Text(
                      playGround.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
