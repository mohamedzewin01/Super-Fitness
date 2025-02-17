import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../view_model/view_model_register/register_cubit.dart';

class CustomActivityLevel extends StatelessWidget {
  const CustomActivityLevel({super.key, required this.viewModel});

  final RegisterCubit viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 32, right: 32),
      child: SizedBox(
        height: 300,
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            children: [
              CustomTextFormFieldRegister(
                onTap: () {
                  viewModel.doAction(ChangeActivityLevelIntent(1));
                },
                controller: TextEditingController(),
                enabled: true,
                hintText: 'Rookie',
                suffix: Radio<int>(
                    value: 1,
                    groupValue: viewModel.currentRadioActivityLevel,
                    fillColor: WidgetStateProperty.all(ColorManager.white),
                    onChanged: (value) {
                      viewModel.doAction(ChangeActivityLevelIntent(value!));
                    }),
              ),
              CustomTextFormFieldRegister(
                onTap: () {
                  viewModel.doAction(ChangeActivityLevelIntent(2));
                },
                controller: TextEditingController(),
                enabled: true,
                hintText: 'Beginner',
                suffix: Radio(
                    value: 2,
                    groupValue: viewModel.currentRadioActivityLevel,
                    fillColor: WidgetStateProperty.all(ColorManager.white),
                    onChanged: (value) {
                      viewModel.doAction(ChangeActivityLevelIntent(value!));
                    }),
              ),
              CustomTextFormFieldRegister(
                onTap: () {
                  viewModel.doAction(ChangeActivityLevelIntent(3));

                },
                controller: TextEditingController(),
                enabled: true,
                hintText: 'Intermediate',
                suffix: Radio(
                    value: 3,
                    groupValue: viewModel.currentRadioActivityLevel,
                    fillColor: WidgetStateProperty.all(ColorManager.white),
                    onChanged: (value) {

                      viewModel.doAction(ChangeActivityLevelIntent(value!));
                    }),
              ),
              CustomTextFormFieldRegister(
                onTap: () {
                  viewModel.doAction(ChangeActivityLevelIntent(4));
                },
                controller: TextEditingController(),
                enabled: true,
                hintText: 'Advance',
                suffix: Radio(
                    value: 4,
                    groupValue: viewModel.currentRadioActivityLevel,
                    fillColor: WidgetStateProperty.all(ColorManager.white),
                    onChanged: (value) {

                      viewModel.doAction(ChangeActivityLevelIntent(value!));
                    }),
              ),
              CustomTextFormFieldRegister(
                onTap: () {
                  viewModel.doAction(ChangeActivityLevelIntent(5));
                },
                controller: TextEditingController(),
                enabled: true,
                hintText: 'True Beast',
                suffix: Radio(
                    value: 5,
                    groupValue: viewModel.currentRadioActivityLevel,
                    fillColor: WidgetStateProperty.all(ColorManager.white),
                    onChanged: (value) {

                      viewModel.doAction(ChangeActivityLevelIntent(value!));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// List<int> ageList = List.generate(150  , (index) => index+50);
