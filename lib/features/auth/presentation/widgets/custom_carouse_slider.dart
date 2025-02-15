import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wheel_slider/wheel_slider.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';

class CustomCarouseSlider extends StatelessWidget {
  const CustomCarouseSlider(
      {super.key,
        required this.carouselController,
        required this.initialPage,
        required this.onPageChanged,
        required this.items, required this.title});

  final CarouselSliderController? carouselController;
  final int initialPage;
  final Function(dynamic) onPageChanged;
  final List items;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0,left: 4.0,right: 4.0),
      child: Column(
        children: [
          Text(
            title,
            style: getSemiBoldStyle(color: ColorManager.orange, fontSize: 16.0),
          ),

          WheelSlider.number(
            perspective: 0.0028,
            isInfinite: false,
            totalCount: items.length,
            itemSize: 50,
            isVibrate: true,
            initValue: initialPage,
            unSelectedNumberStyle: getSemiBoldStyle(color: ColorManager.white, fontSize: 22.0),
            selectedNumberStyle: getSemiBoldStyle(color: ColorManager.orange, fontSize: 30.0),
            currentIndex: initialPage,
            onValueChanged: onPageChanged,
            hapticFeedbackType: HapticFeedbackType.heavyImpact,
          ),
          Icon(
            Icons.arrow_drop_up_sharp,
            color: ColorManager.orange,
            size: 30,
          ),
        ],
      ),
    );
  }
}