import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/cubits/city_cubit/city_cubit.dart';
import 'package:reservision_app/cubits/city_cubit/city_state.dart';
import 'package:reservision_app/models/tab_booking_model.dart';
import 'package:reservision_app/screens/booking_details_screen.dart';
import 'package:reservision_app/screens/description_screen.dart';

class FieldSearchBar extends StatefulWidget {
  const FieldSearchBar({super.key});

  @override
  State<FieldSearchBar> createState() => _FieldSearchBarState();
}

class _FieldSearchBarState extends State<FieldSearchBar> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: kGreyColor,
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: TextField(
            // readOnly: true, // Make it read-only to act as a button
            controller: controller,
            onChanged: (value) {
              context.read<CityCubit>().searchAllCitiesPlaygrounds(value);
            },
            onTap: () {
              print('Search field tapped!');
            },
            decoration: InputDecoration(
              hintText: 'ابحث عن ملعبك ...',
              hintStyle: TextStyle(color: kBorderColor),
              suffixIcon: Icon(Icons.search, color: kTextLight),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: kWhiteColor),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 10,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        BlocBuilder<CityCubit, CityState>(
          builder: (context, state) {
            if (!state.hasSearched) return SizedBox.shrink();

            final results = state.filteredPlaygrounds;

            if (results.isEmpty) {
              return const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  'لا توجد نتائج',
                  style: TextStyle(color: Colors.red),
                ),
              );
            } else {
              return SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    final field = results[index];
                    return ListTile(
                      leadingAndTrailingTextStyle: TextStyle(
                        backgroundColor: kGreenColor,
                      ),
                      // tileColor: kGreyColor,
                      title: Text(field.name),
                      leading: Image.asset(field.image, width: 40),
                      onTap: () {
                        final booking = TabBookingModel(
                          name: field.name,
                          image: field.image,
                          // نترك القيم الباقية فاضية أو افتراضية لأن BookingCubit سيملأها
                          fieldSize: '',
                          period: '',
                          date:
                              DateTime.now()
                                  .toString(), // أو أي قيمة مؤقتة، وسيتم تغييرها في الصفحة
                          price: 0.toString(),
                          status: 'قادم',
                          message: '',
                          day: '',
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    DescriptionScreen(playground: field),
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
