import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:super_fitness/core/resources/app_constants.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../view_model/view_model_register/register_cubit.dart';

class CustomStepGoal extends StatelessWidget {
  const CustomStepGoal({super.key, required this.viewModel});

  final RegisterCubit viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 32, right: 32),
      child: SizedBox(
        height: 300,
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisExtent: 45,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16),
          children: List.generate(5, (index) =>
            CustomTextFormFieldRegister(
        onTap: () {
          viewModel.doAction(ChangeGoalIntent(index+1,AppConstants.goal[index]));
        },
        controller: TextEditingController(),
        enabled: true,
        hintText:AppConstants.goal[index],
        value: index+1,
        onChangeRadio:(value) {
          viewModel.doAction(ChangeGoalIntent(value!,AppConstants.goal[index]));
          log('$value ${AppConstants.goal[index]}');
        } ,
        groupValue:viewModel.currentRadioGoal ,
      ),),
          // children: [
          //   CustomTextFormFieldRegister(
          //     onTap: () {
          //       viewModel.doAction(ChangeGoalIntent(1, 'Gain Weight'));
          //     },
          //     controller: TextEditingController(),
          //     enabled: true,
          //     hintText: 'Gain Weight',
          //     value: 1,
          //     onChangeRadio:(value) {
          //       viewModel.doAction(ChangeGoalIntent(value!, 'Gain Weight'));
          //       log('$value Gain Weight');
          //     } ,
          //     groupValue:viewModel.currentRadioGoal ,
          //   ),
          //   CustomTextFormFieldRegister(
          //     onTap: () {
          //       viewModel.doAction(ChangeGoalIntent(2, 'Lose Weight'));
          //     },
          //     controller: TextEditingController(),
          //     enabled: true,
          //     hintText: 'Lose Weight',
          //     onChangeRadio: (value) {
          //       viewModel.doAction(ChangeGoalIntent(value!, 'Gain Weight'));
          //       log('$value Gain Weight');
          //     } ,
          //     value:2 ,
          //     groupValue:viewModel.currentRadioGoal ,
          //
          //   ),
          //   CustomTextFormFieldRegister(
          //     onTap: () {
          //       viewModel.doAction(ChangeGoalIntent(3, 'Get Fitter'));
          //     },
          //     controller: TextEditingController(),
          //     enabled: true,
          //     hintText: 'Get Fitter',
          //     groupValue:viewModel.currentRadioGoal ,
          //     value: 3,
          //     onChangeRadio: (value) {
          //       viewModel.doAction(ChangeGoalIntent(value!, 'Get Fitter'));
          //       log('$value Get Fitter');
          //     },
          //   ),
          //   CustomTextFormFieldRegister(
          //     onTap: () {
          //       viewModel.doAction(ChangeGoalIntent(4, 'Gain More Flexible'));
          //     },
          //     controller: TextEditingController(),
          //     enabled: true,
          //     hintText: 'Gain More Flexible',
          //     onChangeRadio: (value) {
          //       viewModel.doAction(ChangeGoalIntent(value!, 'Gain More Flexible'));
          //       log('$value Gain More Flexible');
          //     },
          //     value:4 ,
          //     groupValue: viewModel.currentRadioGoal,
          //
          //   ),
          //   CustomTextFormFieldRegister(
          //     onTap: () {
          //       viewModel.doAction(ChangeGoalIntent(5, 'Learn The Basic'));
          //     },
          //     controller: TextEditingController(),
          //     enabled: true,
          //     hintText: 'Learn The Basic',
          //     groupValue:  viewModel.currentRadioGoal,
          //     value: 5,
          //     onChangeRadio:(value) {
          //       viewModel.doAction(ChangeGoalIntent(value!, 'Learn The Basic'));
          //       log('$value Learn The Basic');
          //     } ,
          //   ),
          // ],
        ),
      ),
    );
  }
}
