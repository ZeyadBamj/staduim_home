import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/constants/images_constants.dart';
import 'package:reservision_app/cubits/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:reservision_app/cubits/carousel_cubit/carousel_cubit.dart';
import 'package:reservision_app/helper/media_query.dart';
import 'package:reservision_app/widgets/home/upcoming_booking_card.dart'; // تأكد أنك تستورد Cubit التنقل

class UpcomingBookingsCarousel extends StatefulWidget {
  const UpcomingBookingsCarousel({super.key});

  @override
  State<UpcomingBookingsCarousel> createState() =>
      _UpcomingBookingsCarouselState();
}

class _UpcomingBookingsCarouselState extends State<UpcomingBookingsCarousel> {
  late final PageController _pageController;
  late final CarouselCubit _carouselCubit;

  final List<Map<String, String>> bookings = [
    {'fieldName': 'ملعب إنماء الجديدة (الكبير)', 'imageUrl': kEnamImage},
    {'fieldName': 'ملعب السعادة', 'imageUrl': kEnamImage},
    {'fieldName': 'ملعب الفتح', 'imageUrl': kEnamImage},
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.92);
    _carouselCubit = CarouselCubit(
      pageController: _pageController,
      totalPages: bookings.length,
    );

    // نحاول معرفة الصفحة الحالية مباشرة
    final currentTab = context.read<BottomNavigationCubit>().state;
    if (currentTab == 0) {
      Future.delayed(const Duration(milliseconds: 500), () {
      _carouselCubit.startAutoScroll();
    });
    }
  }

  @override
  void dispose() {
    _carouselCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _carouselCubit,
      child: BlocListener<BottomNavigationCubit, int>(
        listenWhen: (previous, current) => previous != current,
        listener: (context, currentIndex) {
          if (currentIndex == 0) {
            _carouselCubit.startAutoScroll();
          } else {
            _carouselCubit.stopAutoScroll();
          }
        },
        child: SizedBox(
          height: mediaQueryHeight(context, height: 0.18),
          child: PageView.builder(
            controller: _pageController,
            itemBuilder: (context, index) {
              final item = bookings[index % bookings.length];
              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  double value = 1;
                  if (_pageController.position.haveDimensions) {
                    value = (_pageController.page ?? index) - index.toDouble();
                    value = (1 - (value.abs() * 0.2)).clamp(0.95, 1.0);
                  }
                  return Center(
                    child: Transform.scale(
                      scale: value,
                      child: UpcomingBookingCard(
                        fieldName: item['fieldName']!,
                        imageUrl: item['imageUrl']!,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
