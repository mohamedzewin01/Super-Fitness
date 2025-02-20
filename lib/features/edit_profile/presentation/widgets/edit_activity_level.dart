import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:super_fitness/core/resources/app_constants.dart';
import 'package:super_fitness/core/widgets/custom_text_form_field.dart';
import 'package:super_fitness/features/edit_profile/presentation/manager/edit_profile_cubit.dart';
import 'package:super_fitness/features/edit_profile/presentation/widgets/custom_background.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../auth/presentation/view_model/view_model_register/register_cubit.dart';

class EditActivityLevelView extends StatefulWidget {
  const EditActivityLevelView({super.key, required this.viewModel});

  final EditProfileCubit viewModel;

  @override
  State<EditActivityLevelView> createState() => _EditActivityLevelViewState();
}

class _EditActivityLevelViewState extends State<EditActivityLevelView> {
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      assetsImagePng: AssetsManager.backgroundEditProfile1,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomAppBar(isLogo: true, onTap: () => Navigator.pop(context)),
            ),

            SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  "your regular physical activity level ?",
                  style: getSemiBoldStyle(color: Colors.white, fontSize: 20),
                ),
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
                          groupValue: widget.viewModel.currentRadioActivityLevel,
                          onChangeRadio: (index) {
                            widget.viewModel.changeActivityLevel(index!);
                          },
                          enabled: true,
                          hintText: AppConstants.activityLevel[index],
                          onTap: () {
                            setState(() {});
                            widget.viewModel.changeActivityLevel(index);
                            log(AppConstants.activityLevel[
                                widget.viewModel.currentRadioActivityLevel]);
                          },
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                          const EdgeInsets.only( top: 16, left: 16, right: 16,),
                          child: CustomElevatedButton(
                              buttonColor: ColorManager.orange,
                              title: 'Done',
                              onPressed: () {
                                Navigator.pop(context);
                              }),
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
