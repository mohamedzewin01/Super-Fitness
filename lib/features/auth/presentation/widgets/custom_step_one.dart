import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../view_model/view_model_cubit.dart';

class CustomStepOne extends StatelessWidget {
  const CustomStepOne({super.key, required this.viewModel});
  final ViewModelCubit viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
           onTap:

              () {
             viewModel.changeGender(true);
             viewModel.changeIndicator(1);

          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: viewModel.isMale &&
                  viewModel.currentIndicator ==
                      1
                  ? ColorManager.orange
                  : Colors.transparent,
            ),
            child: SvgPicture.asset(
              AssetsManager.male,
            ),
          ),
        ),
        SizedBox(height: 16 ,),
        GestureDetector(
          onTap:

              () {
            viewModel.changeGender(false);
            viewModel.changeIndicator(1);
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: !viewModel.isMale &&
                  viewModel.currentIndicator ==
                      1
                  ? ColorManager.orange
                  : Colors.transparent,
            ),
            child: SvgPicture.asset(
              AssetsManager.female,
            ),
          ),
        ),
      ],
    );
  }
}