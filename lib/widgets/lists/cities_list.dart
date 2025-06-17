import 'package:flutter/material.dart';
import 'package:reservision_app/constants/app_colors.dart';
import 'package:reservision_app/models/cities_model.dart';

class CitiesList extends StatelessWidget {
  final List<CitiesModel> playgrounds;

  const CitiesList({super.key, required this.playgrounds});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: playgrounds.length,
      itemBuilder: (context, index) {
        final playground = playgrounds[index];
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
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  playground.image,
                  height: 180,
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
                      playground.name,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
