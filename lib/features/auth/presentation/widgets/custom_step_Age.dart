import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:super_fitness/core/resources/app_constants.dart';
import '../view_model/view_model_register/register_cubit.dart';
import 'custom_carouse_slider.dart';


class CustomStepAge extends StatelessWidget {
  const CustomStepAge({super.key, required this.viewModel});

  final RegisterCubit viewModel;

  @override
  Widget build(BuildContext context) {
    return CustomCarouseSlider(
      title: 'Year',
        carouselController: viewModel.controllerAge,
        initialPage: viewModel.useAge,
        onPageChanged: (index, p1) {
          viewModel.changeAge(AppConstants.ageList[index]);
         log('Age is ${AppConstants.ageList[index]}');
        },
        items: AppConstants.ageList);

  }
}




