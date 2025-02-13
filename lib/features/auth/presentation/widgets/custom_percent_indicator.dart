import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../view_model/view_model_cubit.dart';

class CustomPercentIndicator extends StatelessWidget {
  const CustomPercentIndicator({
    super.key,
    required this.viewModel,
  });

  final ViewModelCubit viewModel;

  @override
  Widget build(BuildContext context) {
    int totalSteps = 10;
    return CircularPercentIndicator(
      radius: 25.0,
      lineWidth: 6.0,
      percent: viewModel.currentIndicator / totalSteps,
      animationDuration: 1200,
      startAngle: 250,
      animation: true,
      curve: Curves.linear,
      center: Text(
        "${viewModel.currentIndicator}/6",
        style:
        getBoldStyle(color: Colors.white, fontSize: 16),
      ),
      progressColor: ColorManager.orange,
      backgroundColor: Colors.transparent,
    );
  }
}