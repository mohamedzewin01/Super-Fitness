import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_dialog.dart';
import 'register_form.dart';
import '../view_model/view_model_register/register_cubit.dart';
import 'custom_register_step.dart';
import 'custom_step_Age.dart';
import 'custom_step_activity_level.dart';
import 'custom_step_gender.dart';
import 'custom_step_goal.dart';
import 'custom_step_height.dart';
import 'custom_step_weight.dart';

class CustomRegisterPagesView extends StatelessWidget {
  const CustomRegisterPagesView({
    super.key,
    required this.viewModel,
  });

  final RegisterCubit viewModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        controller: viewModel.pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          if (value < viewModel.currentIndicator - 1) {
            viewModel.changeIndicator(viewModel.currentIndicator - 1);
          }
        },
        children: [
          RegisterForm(viewModel: viewModel),
          CustomRegisterStep(
              title: 'TELL US ABOUT YOURSELF',
              subTitle: 'We Need To Know Your Gender',
              viewModel: viewModel,
              bodyScreen: CustomStepGender(
                viewModel: viewModel,
              ),
              onPressed: () {
                viewModel.pageController.nextPage(
                    duration: Duration(milliseconds: 1000),
                    curve: Curves.easeIn);

                viewModel.changeIndicator(2);
                log(viewModel.currentIndicator.toString());
              }),
          CustomRegisterStep(
              title: 'HOW OLD ARE YOU ?',
              subTitle: 'This Helps Us Create Your Personalized Plan',
              viewModel: viewModel,
              bodyScreen: CustomStepAge(
                viewModel: viewModel,
              ),
              onPressed: () {
                viewModel.pageController.nextPage(
                    duration: Duration(milliseconds: 1000),
                    curve: Curves.easeIn);
                viewModel.changeIndicator(3);

                log(viewModel.currentIndicator.toString());
              }),
          CustomRegisterStep(
            title: 'WHAT IS YOUR WEIGHT ?',
            subTitle: 'This Helps Us Create Your Personalized Plan',
            viewModel: viewModel,
            bodyScreen: CustomStepWeight(
              viewModel: viewModel,
            ),
            onPressed: () {
              viewModel.pageController.nextPage(
                  duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
              viewModel.changeIndicator(4);
              log(viewModel.currentIndicator.toString());
            },
          ),
          CustomRegisterStep(
            title: 'WHAT IS YOUR HEIGHT ?',
            subTitle: 'This Helps Us Create Your Personalized Plan',
            viewModel: viewModel,
            bodyScreen: CustomStepHeight(
              viewModel: viewModel,
            ),
            onPressed: () {
              viewModel.pageController.nextPage(
                  duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
              viewModel.changeIndicator(5);
              log(viewModel.currentIndicator.toString());
            },
          ),
          CustomRegisterStep(
            title: 'WHAT IS YOUR GOAL ?',
            subTitle: 'This Helps Us Create Your Personalized Plan',
            viewModel: viewModel,
            bodyScreen: CustomStepGoal(
              viewModel: viewModel,
            ),
            onPressed: () {
              viewModel.pageController.nextPage(
                  duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
              viewModel.changeIndicator(6);
              log(viewModel.currentIndicator.toString());
            },
          ),
          CustomRegisterStep(
            title: 'YOUR REGULAR PHYSICAL ACTIVITY LEVEL?',
            subTitle: 'This Helps Us Create Your Personalized Plan',
            viewModel: viewModel,
            bodyScreen: CustomActivityLevel(
              viewModel: viewModel,
            ),
            onPressed: () async {
              if (viewModel.useHeight != 0 &&
                  viewModel.useAge != 0 &&
                  viewModel.useWeight != 0 &&
                  viewModel.currentRadioActivityLevel != 0 &&
                  viewModel.userGender != '' &&
                  viewModel.currentRadioGoal != 0) {
                viewModel.register();
              } else if (viewModel.currentRadioActivityLevel == 0) {
                CustomDialog.showIncompleteDataDialog(context,
                    onPressed: () async {
                  if (viewModel.currentRadioActivityLevel == 0) {
                    await viewModel.pageController.animateToPage(
                      6,
                      duration: Duration(milliseconds: 1000),
                      curve: Curves.easeIn,
                    );
                    viewModel.changeIndicator(6);
                    log('jumpToPage     6');
                    if (!context.mounted) return;
                    Navigator.pop(context);
                  }
                });
              } else if (viewModel.currentRadioGoal == 0) {
                CustomDialog.showIncompleteDataDialog(context,
                    onPressed: () async {
                  if (viewModel.currentRadioGoal == 0) {
                    await viewModel.pageController.animateToPage(5,
                        curve: Curves.easeIn,
                        duration: Duration(milliseconds: 1000));
                    viewModel.changeIndicator(5);
                    log('jumpToPage      5');
                    if (!context.mounted) return;
                    Navigator.pop(context);
                  }
                });
              } else {
                CustomDialog.showIncompleteDataDialog(context, onPressed: () {
                  Navigator.pop(context);
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
