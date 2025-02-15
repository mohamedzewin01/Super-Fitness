import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:super_fitness/core/resources/app_constants.dart';
import 'package:super_fitness/features/auth/presentation/widgets/custom_carouse_slider.dart';
import '../view_model/view_model_register/register_cubit.dart';

class CustomStepWeight extends StatelessWidget {
  const CustomStepWeight({super.key, required this.viewModel});

  final RegisterCubit viewModel;

  @override
  Widget build(BuildContext context) {
    return CustomCarouseSlider(carouselController:viewModel.controllerWeight ,
        initialPage: viewModel.useWeight,
        onPageChanged: (index) {
          viewModel.changeWeight(index);
          log("weight is $index");
        },
        items: AppConstants.weightList,
        title: 'Kg');



  }
}


