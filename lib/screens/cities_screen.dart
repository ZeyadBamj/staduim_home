import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/constants/app_colors.dart';
import 'package:reservision_app/cubits/city_cubit/city_cubit.dart';
import 'package:reservision_app/cubits/city_cubit/city_state.dart';
import 'package:reservision_app/widgets/common/app_bar_with_search.dart';
import 'package:reservision_app/widgets/common/custom_elevated_button.dart';
import 'package:reservision_app/widgets/common/my_drawer.dart';
import 'package:reservision_app/widgets/lists/cities_list.dart';

class CitiesScreen extends StatelessWidget {
  const CitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CityCubit>();
    final cities = ['عدن', 'المهرة', 'شبوة', 'حضرموت'];

    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBarWithSearch(
        title: 'ملاعبك',
        onNotification: () {
          // Handle profile icon tap
          print('Notification icon tapped!');
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocBuilder<CityCubit, CityState>(
          builder: (context, state) {
            return Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                        cities.map((city) {
                          return CustomElevatedButton(
                            city: city,
                            isSelected: city == state.selectedCity,
                            onTap: () => cubit.selectCity(city),
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
                          : CitiesList(playgrounds: state.playgrounds),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
