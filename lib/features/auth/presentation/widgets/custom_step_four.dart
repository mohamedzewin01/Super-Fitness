import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:super_fitness/core/resources/color_manager.dart';
import 'package:super_fitness/core/resources/style_manager.dart';
import '../view_model/view_model_cubit.dart';

class CustomStepFour extends StatefulWidget {
  const CustomStepFour({super.key, required this.viewModel});

  final ViewModelCubit viewModel;

  @override
  State<CustomStepFour> createState() => _CustomStepFourState();
}

class _CustomStepFourState extends State<CustomStepFour> {
  final CarouselSliderController? controller = CarouselSliderController();
  int selectedIndex = 10;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 8.0),
      child: Column(
        children: [
          Text('Year',style: getSemiBoldStyle(color: ColorManager.orange,fontSize: 16.0),),
          CarouselSlider(
            carouselController: controller,
            options: CarouselOptions(
              autoPlay: false,
              aspectRatio: 6.0,
              viewportFraction: 0.12,
              initialPage: selectedIndex,
               enableInfiniteScroll: false,
              enlargeCenterPage: true,
              enlargeFactor: .18,
              disableCenter: true,
              onPageChanged: (index, reason) {
                setState(() {
                  selectedIndex = index;
                  print(ageList[index]);
                });
              },
            ),
            items: ageList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 0),
                    child: Center(
                      child: Text(
                        '$i',
                        style: getSemiBoldStyle(
                          color: i == ageList[selectedIndex] ? ColorManager.orange : Colors.white,
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Icon(Icons.arrow_drop_up_sharp, color: ColorManager.orange,size: 30,),
        ],
      ),
    );
  }
}

List<int> ageList = List.generate(150  , (index) => index+50);
