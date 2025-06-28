import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/cubits/city_cubit/city_cubit.dart';
import 'package:reservision_app/cubits/city_cubit/city_state.dart';
import 'package:reservision_app/models/city_model.dart';
import 'package:reservision_app/screens/description_screen.dart';

// class CityList extends StatelessWidget {
//   final List<CityModel> cityModel;

//   const CityList({super.key, required this.cityModel});

//   @override
//   Widget build(BuildContext context) {
//     final blocCityModel = BlocProvider.of<CityCubit>(context).cityModel;
//     return ListView.builder(
//       itemCount: cityModel.length,
//       itemBuilder: (context, index) {
//         final playGround = cityModel[index];
//         return GestureDetector(
//           onTap: () {
//             Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder:
//                     (context) => DescriptionScreen(playground: blocCityModel!),
//               ),
//             );
//           },
//           child: Card(
//             margin: const EdgeInsets.symmetric(vertical: 8.0),
//             elevation: 4,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ClipRRect(
//                   borderRadius: const BorderRadius.vertical(
//                     top: Radius.circular(12),
//                   ),
//                   child: Image.asset(
//                     playGround.image,
//                     height: MediaQuery.of(context).size.height * 0.23,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Row(
//                     children: [
//                       const Icon(Icons.sports_soccer, color: kGreenColor),
//                       const SizedBox(width: 8),
//                       Text(
//                         playGround.name,
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

class CityList extends StatelessWidget {
  const CityList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityCubit, CityState>(
      builder: (context, state) {
        final playgrounds = state.playgrounds;

        if (state.selectedCity == null || playgrounds.isEmpty) {
          return const Center(
            child: Text(
              'لا توجد ملاعب لعرضها',
              style: TextStyle(fontSize: 16, color: kGreyColor),
            ),
          );
        }

        return ListView.builder(
          itemCount: playgrounds.length,
          itemBuilder: (context, index) {
            final playGround = playgrounds[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        DescriptionScreen(playground: playGround),
                  ),
                );
              },
              child: Card(
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
              ),
            );
          },
        );
      },
    );
  }
}
