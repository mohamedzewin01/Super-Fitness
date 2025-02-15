import 'dart:developer';
import 'package:flutter/material.dart';
import '../../../../core/resources/app_constants.dart';
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
        onPageChanged: (
          index,
        ) {
          viewModel.changeAge(index);
          log('Age is $index');
        },
        items: AppConstants.ageList);
  }
}
