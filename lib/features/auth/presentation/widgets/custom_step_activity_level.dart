import 'dart:developer';
import 'package:flutter/material.dart';
import '../../../../core/resources/app_constants.dart';
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
            children: List.generate(
              5,
              (index) => CustomTextFormFieldRegister(
                onTap: () {
                  viewModel.doAction(ChangeActivityLevelIntent(index + 1));
                  log(viewModel.currentRadioActivityLevel.toString());
                },
                enabled: true,
                hintText: AppConstants.activityLevel[index],
                value: index + 1,
                onChangeRadio: (value) {
                  viewModel.doAction(ChangeActivityLevelIntent(value!));
                  log('${AppConstants.activityLevel[index]} $value');
                },
                groupValue: viewModel.currentRadioActivityLevel,
              ),
            ),
            // children: [
            //   CustomTextFormFieldRegister(
            //     onTap: () {
            //       viewModel.doAction(ChangeActivityLevelIntent(1));
            //       log(viewModel.currentRadioActivityLevel.toString());
            //     },
            //     enabled: true,
            //     hintText: 'Rookie',
            //     value: 1,
            //     onChangeRadio: (value) {
            //       viewModel.doAction(ChangeActivityLevelIntent(value!));
            //
            //     },
            //     groupValue: viewModel.currentRadioActivityLevel,
            //   ),
            //   CustomTextFormFieldRegister(
            //     value: 2,
            //     groupValue: viewModel.currentRadioActivityLevel,
            //     onChangeRadio: (value) {
            //       viewModel.doAction(ChangeActivityLevelIntent(value!));
            //     },
            //     onTap: () {
            //       viewModel.doAction(ChangeActivityLevelIntent(2));
            //       log(viewModel.currentRadioActivityLevel.toString());
            //     },
            //     controller: TextEditingController(),
            //     enabled: true,
            //     hintText: 'Beginner',
            //
            //   ),
            //   CustomTextFormFieldRegister(
            //     onTap: () {
            //       viewModel.doAction(ChangeActivityLevelIntent(3));
            //       log(viewModel.currentRadioActivityLevel.toString());
            //     },
            //     enabled: true,
            //     hintText: 'Intermediate',
            //     groupValue: viewModel.currentRadioActivityLevel ,
            //     onChangeRadio:(value) {
            //       viewModel.doAction(ChangeActivityLevelIntent(value!));
            //
            //     } ,
            //     value:3 ,
            //
            //   ),
            //   CustomTextFormFieldRegister(
            //     onTap: () {
            //       viewModel.doAction(ChangeActivityLevelIntent(4));
            //       log(viewModel.currentRadioActivityLevel.toString());
            //     },
            //     controller: TextEditingController(),
            //     enabled: true,
            //     hintText: 'Advance',
            //     value:4 ,
            //     onChangeRadio:(value) {
            //       viewModel.doAction(ChangeActivityLevelIntent(value!));
            //
            //     } ,
            //     groupValue: viewModel.currentRadioActivityLevel,
            //
            //   ),
            //   CustomTextFormFieldRegister(
            //     onTap: () {
            //       viewModel.doAction(ChangeActivityLevelIntent(5));
            //       log(viewModel.currentRadioActivityLevel.toString());
            //     },
            //     enabled: true,
            //     hintText: 'True Beast',
            //     groupValue:viewModel.currentRadioActivityLevel ,
            //     onChangeRadio: (value) {
            //       viewModel.doAction(ChangeActivityLevelIntent(value!));
            //     },
            //     value: 5,
            //
            //   ),
            // ],
          ),
        ),
      ),
    );
  }
}


