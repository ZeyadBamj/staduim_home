import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/constants/constants.dart';
import 'package:reservision_app/cubits/city_cubit/city_cubit.dart';
import 'package:reservision_app/cubits/city_cubit/city_state.dart';
import 'package:reservision_app/screens/description_screen.dart';
import 'package:reservision_app/widgets/common/app_bar_with_search.dart';
import 'package:reservision_app/widgets/common/custom_elevated_button.dart';
import 'package:reservision_app/widgets/common/my_drawer.dart';
import 'package:reservision_app/widgets/lists/city_list.dart';

class CitiesScreen extends StatelessWidget {
  const CitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CityCubit>();
    final cities = ['عدن', 'المهرة', 'شبوة', 'حضرموت'];

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return DescriptionScreen();
            },
          ),
        );
      },
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: CustomAppBar(
          title: 'المدن',
          onNotification: () {
            // Handle profile icon tap
            print('Notification icon tapped!');
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: BlocBuilder<CityCubit, CityState>(
            builder: (context, state) {
              return Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children:
                          cities.map((cityName) {
                            return CustomElevatedButton(
                              city: cityName,
                              isSelected: cityName == state.selectedCity,
                              onPressed: () => cubit.selectCity(cityName),
                            );
                          }).toList(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child:
                        state.selectedCity == null
                            ? const Center(
                              child: Text(
                                'اختر مدينة لعرض الملاعب',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: kGreyColor,
                                ),
                              ),
                            )
                            : CityList(cityModel: state.playgrounds),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
