import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/constants/colors_constants.dart';
import 'package:reservision_app/cubits/user_cubits/playground_cubit/playground_cubit.dart';
import 'package:reservision_app/cubits/user_cubits/playground_cubit/playground_state.dart';
import 'package:reservision_app/helper/media_query.dart';
import 'package:reservision_app/screens/user_screens/details_screen.dart';
import 'package:reservision_app/widgets/user_widgets/common/common/custom_app_bar.dart';
import 'package:reservision_app/widgets/user_widgets/common/common/custom_elevated_button.dart';
import 'package:reservision_app/widgets/user_widgets/common/common/my_drawer.dart';

class PlaygroundScreen extends StatelessWidget {
  const PlaygroundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PlaygroundCubit>();
    final cities = ['عدن', 'المهرة', 'شبوة', 'حضرموت'];

    return Scaffold(
      drawer: const MyDrawer(),
      appBar: const CustomAppBar(title: 'المدن'),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocBuilder<PlaygroundCubit, PlayGroundState>(
          builder: (context, state) {
            return Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: ScrollController(),
                  child: Row(
                    children:
                        cities.map((cityName) {
                          return CustomElevatedButton(
                            name: cityName,
                            padding: EdgeInsets.symmetric(horizontal: 22),
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
                              style: TextStyle(fontSize: 16, color: kGreyColor),
                            ),
                          )
                          : BlocBuilder<PlaygroundCubit, PlayGroundState>(
                            builder: (context, state) {
                              final playgrounds = state.playgrounds;

                              if (state.selectedCity == null ||
                                  playgrounds.isEmpty) {
                                return const Center(
                                  child: Text(
                                    'لا توجد ملاعب لعرضها',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: kGreyColor,
                                    ),
                                  ),
                                );
                              } else {
                                return ListView.builder(
                                  itemCount: playgrounds.length,
                                  itemBuilder: (context, index) {
                                    final playGround = playgrounds[index];
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder:
                                                (context) => DetailsScreen(
                                                  playground: playGround,
                                                ),
                                          ),
                                        );
                                      },
                                      child: Card(
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 8,
                                        ),
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          side: const BorderSide(
                                            color: kPrimaryColor,
                                            width: 2,
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.vertical(
                                                    top: Radius.circular(10),
                                                  ),
                                              child: Image.asset(
                                                playGround.image,
                                                height: mediaQueryHeight(
                                                  context,
                                                  height: 0.23,
                                                ),
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(
                                                12.0,
                                              ),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.sports_soccer,
                                                    color: kPrimaryColor,
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Text(
                                                    '(${state.selectedCity})',
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Text(
                                                    playGround.name,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
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
                              }
                            },
                          ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
