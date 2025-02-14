import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
  final Function(int, CarouselPageChangedReason)? onPageChanged;
  final List items;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: Column(
        children: [
          Text(
            title,
            style: getSemiBoldStyle(color: ColorManager.orange, fontSize: 16.0),
          ),
          CarouselSlider(
            carouselController: carouselController,
            options: CarouselOptions(
              autoPlay: false,
              aspectRatio: 6.0,
              viewportFraction: 0.13,
              initialPage: initialPage,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              enlargeFactor: .18,
              disableCenter: true,
              onPageChanged: onPageChanged,
            ),
            items: items.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                    child: Center(
                      child: Text(
                        '$i',
                        style: getSemiBoldStyle(
                          color: i == items[initialPage]
                              ? ColorManager.orange
                              : Colors.white,
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
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