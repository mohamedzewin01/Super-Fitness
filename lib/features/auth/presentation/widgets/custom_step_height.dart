import 'dart:developer';


import 'package:flutter/material.dart';
import '../../../../core/resources/app_constants.dart';
import '../view_model/register_cubit.dart';
import 'custom_carouse_slider.dart';

class CustomStepHeight extends StatelessWidget {
  const CustomStepHeight({super.key, required this.viewModel});

  final RegisterCubit viewModel;

  @override
  Widget build(BuildContext context) {
    return CustomCarouseSlider(carouselController:viewModel.controllerHeight ,
        initialPage: viewModel.useHeight,
        onPageChanged: (index, p1) {
          viewModel.changeHeight(AppConstants.heightList[index]);
          log("height is ${AppConstants.heightList[index]}");
        },
        items: AppConstants.heightList,
        title: 'CM');

  }
}


