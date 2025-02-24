import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../view_model/view_model_register/register_cubit.dart';

class CustomStepGender extends StatelessWidget {
  const CustomStepGender({super.key, required this.viewModel});
  final RegisterCubit viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      // spacing: 16,
      children: [
        SizedBox(height: 16 ,),
        GestureDetector(
           onTap:
              () {
             viewModel.doAction(ChangeGenderIntent(true));
             viewModel.doAction(ChangeIndicatorIntent(1));
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
        GestureDetector(
          onTap:
              () {
            viewModel.doAction(ChangeGenderIntent(false));
            viewModel.doAction(ChangeIndicatorIntent(1));
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