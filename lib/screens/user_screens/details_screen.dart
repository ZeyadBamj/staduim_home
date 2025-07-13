import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservision_app/constants/colors_constants.dart';
import 'package:reservision_app/constants/text_style_constants.dart';
import 'package:reservision_app/cubits/user_cubits/main_cubit/main_cubit.dart';
import 'package:reservision_app/helper/media_query.dart';
import 'package:reservision_app/models/user_model/playground_model.dart';
import 'package:reservision_app/screens/user_screens/booking_screen.dart';
import 'package:reservision_app/widgets/user_widgets/common/common/custom_button.dart';

class DetailsScreen extends StatefulWidget {
  final PlayGroundModel playground;

  const DetailsScreen({super.key, required this.playground});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late final PageController _pageController;
  late final MainCubit _carouselCubit;

  static const int _initialIndex = 5000;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.92,
      initialPage: _initialIndex,
    );

    _carouselCubit = MainCubit(
      pageController: _pageController,
      totalPages: widget.playground.images.length,
      initialIndex: _initialIndex,
    );

    Future.delayed(const Duration(milliseconds: 500), () {
      _carouselCubit.startAutoScroll();
    });
  }

  @override
  void dispose() {
    _carouselCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainCubit>(
      create: (_) => _carouselCubit,
      child: Scaffold(
        appBar: AppBar(title: Text(widget.playground.name), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: mediaQueryHeight(context, height: 0.3),
                  child: PageView.builder(
                    controller: _pageController,
                    itemBuilder: (context, index) {
                      final image =
                          widget.playground.images[index %
                              widget.playground.images.length];
                      return AnimatedBuilder(
                        animation: _pageController,
                        builder: (context, child) {
                          double value = 1;
                          if (_pageController.position.haveDimensions) {
                            value =
                                (_pageController.page ?? index) -
                                index.toDouble();
                            value = (1 - (value.abs() * 0.2)).clamp(0.95, 1.0);
                          }
                          return Center(
                            child: Transform.scale(
                              scale: value,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(
                                    color: kPrimaryColor,
                                    width: 3,
                                  ),
                                ),
                                elevation: 5,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    image,
                                    cacheWidth: 600, // لتقليل حجم الصورة
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                // باقي التفاصيل كما هي
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'أيام العمل: مثال يوميا',
                      style: DetailsStyle.kText,
                    ),
                    const Text(
                      'أوقات العمل: مثال من 4م الى 12ص',
                      style: DetailsStyle.kText,
                    ),
                    const Text(
                      'عدد الملاعب: مثال 2',
                      style: DetailsStyle.kText,
                    ),
                    const Text(
                      'حجم الملعب 1: مثال صغير',
                      style: DetailsStyle.kText,
                    ),
                    const Text(
                      'كم يتسع الملعب 1: مثال 5 × 5',
                      style: DetailsStyle.kText,
                    ),
                    const Text(
                      'حجم الملعب 2: مثال كبير',
                      style: DetailsStyle.kText,
                    ),
                    const Text(
                      'كم يتسع الملعب 2: مثال 8 × 8',
                      style: DetailsStyle.kText,
                    ),
                    const Text(
                      'مزايا الملعب: مثال يوجد لدينا برادة مياه',
                      style: DetailsStyle.kText,
                    ),
                    const Text(
                      'حسابات التحويل المالي: مثال حساب العمقي: 32323423233',
                      style: DetailsStyle.kText,
                    ),
                    const Text(
                      'أرقام التواصل: مثال رقم صاحب الملعب: 777777777',
                      style: DetailsStyle.kText,
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                CustomButton(
                  text: 'احجز الآن',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const BookingScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
