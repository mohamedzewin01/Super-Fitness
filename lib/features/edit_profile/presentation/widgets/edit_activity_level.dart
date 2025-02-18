import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:super_fitness/core/widgets/custom_text_form_field.dart';
import 'package:super_fitness/features/edit_profile/presentation/manager/edit_profile_cubit.dart';
import 'package:super_fitness/features/edit_profile/presentation/widgets/custom_backgroung.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(46.0),
                child: Image.asset(
                  AssetsManager.logo,
                  fit: BoxFit.cover,
                  width: 70,
                  height: 48,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Column(
                spacing: 16,
                children: List.generate(
                  5,
                  (index) => CustomTextFormFieldRegister(
                    value: index,
                    groupValue: widget.viewModel.currentRadioActivityLevel,
                    onChangeRadio: (index) {
                      widget.viewModel.changeActivityLevel(index!);
                    },
                    enabled: true,
                    hintText: activityLevel[index],
                    onTap: () {
                      setState(() {});
                      widget.viewModel.changeActivityLevel(index);
                      log(activityLevel[widget.viewModel.currentRadioActivityLevel]);
                    },
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(right: 10, left: 16, top: 16),
                      child: CustomElevatedButton(
                          buttonColor: ColorManager.orange,
                          title: 'Done',
                          onPressed: () {}),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> activityLevel = [
  'Rookie',
  'Beginner',
  'Intermediate',
  'Advance',
  'True Beast'
];
