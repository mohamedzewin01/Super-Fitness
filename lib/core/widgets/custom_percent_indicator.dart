import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../resources/color_manager.dart';
import '../resources/style_manager.dart';

class CustomPercentIndicator extends StatelessWidget {
  const CustomPercentIndicator({
    super.key, required this.currentIndicator,

  });


  final int currentIndicator;

  @override
  Widget build(BuildContext context) {
    int totalSteps = 6;

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(
        begin: 0.0,
        end: currentIndicator / totalSteps,
      ),
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return CircularPercentIndicator(
          radius: 25.0,
          lineWidth: 6.0,
          percent: value.clamp(0.0, 1.0),
          startAngle: 250,
          animation: false,
          center: Text(
            "$currentIndicator/$totalSteps",
            style: getBoldStyle(color: Colors.white, fontSize: 16),
          ),
          progressColor: ColorManager.orange,
          backgroundColor: Colors.transparent,
        );
      },
    );
  }
}
