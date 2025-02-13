import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../view_model/view_model_cubit.dart';

class CustomRegisterStep extends StatelessWidget {
  const CustomRegisterStep(
      {super.key, required this.title, required this.subTitle, required this.viewModel, required this.onPressed, required this.bodyScreen});

  final String title;
  final String subTitle;
  final ViewModelCubit viewModel;
  final void Function() onPressed;
  final Widget bodyScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  title,
                  style: getSemiBoldStyle(
                      color: Colors.white,
                      fontSize: 20),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(

                  subTitle,
                  style: getMediumStyle(
                      color: Colors.white,
                      fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(30),
                color: ColorManager.primary
                    .withAlpha(160),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  spacing: 16,
                  children: [
                    bodyScreen,
                    viewModel.currentIndicator == 0
                        ? SizedBox()
                        : Row(
                      children: [
                        Expanded(
                          child:
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: CustomElevatedButton(
                                buttonColor:
                                ColorManager
                                    .orange,
                                title: 'NEXT',
                                onPressed:
                                onPressed),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}


