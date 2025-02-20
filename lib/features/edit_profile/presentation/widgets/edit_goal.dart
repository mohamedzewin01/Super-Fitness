import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:super_fitness/core/resources/app_constants.dart';
import 'package:super_fitness/core/widgets/custom_text_form_field.dart';
import 'package:super_fitness/features/edit_profile/presentation/manager/edit_profile_cubit.dart';
import 'package:super_fitness/features/edit_profile/presentation/widgets/custom_background.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_elevated_button.dart';

class EditGoalView extends StatefulWidget {
  const EditGoalView({super.key, required this.viewModel});

  final EditProfileCubit viewModel;

  @override
  State<EditGoalView> createState() => _EditGoalViewState();
}

class _EditGoalViewState extends State<EditGoalView> {
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      assetsImagePng: AssetsManager.backgroundEditProfile1,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomAppBar(
                  isLogo: true, onTap: () => Navigator.pop(context)),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                spacing: 8,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "What Is Your Goal ?",
                      style:
                          getSemiBoldStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "This Helps Us create Your Personalized Plan",
                      style: getRegularStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: BoxDecoration(
                color: ColorManager.primary.withAlpha(150),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Column(
                    spacing: 16,
                    children: List.generate(
                      5,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: CustomTextFormFieldRegister(
                          value: index,
                          groupValue: widget.viewModel.currentRadioGoal,
                          onChangeRadio: (index) {
                            widget.viewModel.changeGoal(index!);
                          },
                          enabled: true,
                          hintText: AppConstants.goal[index],
                          onTap: () {
                            setState(() {});

                            widget.viewModel.changeGoal(index);
                            log(AppConstants.goal[index]);
                          },
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 16,
                            left: 16,
                            right: 16,
                          ),
                          child: CustomElevatedButton(
                            buttonColor: ColorManager.orange,
                            title: 'Done',
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
