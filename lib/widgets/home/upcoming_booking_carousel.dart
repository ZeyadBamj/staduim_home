import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reservision_app/constants/constants.dart';
import 'upcoming_booking_card.dart';

class UpcomingBookingsCarousel extends StatefulWidget {
  const UpcomingBookingsCarousel({super.key});

  @override
  State<UpcomingBookingsCarousel> createState() =>
      _UpcomingBookingsCarouselState();
}

class _UpcomingBookingsCarouselState extends State<UpcomingBookingsCarousel> {
  final PageController _pageController = PageController(
    viewportFraction: 0.92,
  ); // قريبة للمقاس الأصلي

  late Timer _autoScrollTimer;
  int _currentIndex = 0;

  List<Map<String, String>> bookings = [
    {
      'fieldName': 'ملعب إنماء الجديدة (الكبير)',
      'date': '25 يوليو',
      'time': '10:00 م',
      'imageUrl': kEnamImage,
    },
    {
      'fieldName': 'ملعب السعادة',
      'date': '27 يوليو',
      'time': '6:00 م',
      'imageUrl': kEnamImage,
    },
    {
      'fieldName': 'ملعب الفتح',
      'date': '30 يوليو',
      'time': '8:00 م',
      'imageUrl': kEnamImage,
    },
  ];

  @override
  void initState() {
    super.initState();

    _autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        _currentIndex++;
        _pageController.animateToPage(
          _currentIndex,
          duration: const Duration(seconds: 1),
          curve: Curves.easeOutSine,
        );
      }
      // print('Timer does not go : ${_autoScrollTimer}');
    });
  }

  @override
  void dispose() {
    _autoScrollTimer.cancel();
    // print('cancel timer : ${_autoScrollTimer}');
    _pageController.dispose();
    // print('cancel timer : ${_pageController}');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          MediaQuery.of(context).size.height *
          0.18, // نفس ارتفاع البطاقة الأصلية
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          final item = bookings[index % bookings.length]; // دوران يدوي
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double value = 1.0;
              if (_pageController.position.haveDimensions) {
                value = (_pageController.page ?? index) - index.toDouble();
                value = (1 - (value.abs() * 0.2)).clamp(
                  0.95,
                  1.0,
                ); // تأثير خفيف جدًا
              }
              return Center(
                child: Transform.scale(
                  scale: value,
                  child: UpcomingBookingCard(
                    fieldName: item['fieldName']!,
                    date: item['date']!,
                    time: item['time']!,
                    imageUrl: item['imageUrl']!,
                    onTap: () {
                      print("تم الضغط على: ${item['fieldName']}");
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
