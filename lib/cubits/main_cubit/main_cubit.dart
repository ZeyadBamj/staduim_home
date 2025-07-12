// lib/cubit/carousel/carousel_cubit.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final PageController pageController;
  final int totalPages;
  Timer? _timer;
  int _currentIndex;
  bool firstJumpDone = false;

  MainCubit({
    required this.pageController,
    required this.totalPages,
    int initialIndex = 5000,
  }) : _currentIndex = initialIndex,
       super(CarouselInitial());

  void startAutoScroll() {
    stopAutoScroll();

    if (!firstJumpDone) {
      pageController.jumpToPage(_currentIndex);
      firstJumpDone = true;
    }

    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageController.hasClients) {
        _currentIndex++;
        pageController.animateToPage(
          _currentIndex,
          duration: const Duration(seconds: 1),
          curve: Curves.easeOutSine,
        );
      }
    });
  }

  // void startAutoScroll() {
  //   stopAutoScroll();
  //   _timer?.cancel();
  //   _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
  //     if (pageController.hasClients) {
  //       _currentIndex++;
  //       pageController.animateToPage(
  //         _currentIndex,
  //         duration: const Duration(seconds: 1),
  //         curve: Curves.easeOutSine,
  //       );
  //     }
  //   });
  // }

  void stopAutoScroll() {
    _timer?.cancel();
    _timer = null;
  }

  void resetIndex() {
    _currentIndex = 0;
  }

  @override
  Future<void> close() {
    stopAutoScroll();
    pageController.dispose();
    return super.close();
  }
}
