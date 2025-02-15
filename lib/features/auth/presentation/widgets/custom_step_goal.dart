import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:super_fitness/core/resources/color_manager.dart';
import 'package:super_fitness/core/widgets/custom_text_form_field.dart';
import '../view_model/view_model_register/register_cubit.dart';

class CustomStepGoal extends StatelessWidget {
  const CustomStepGoal({super.key, required this.viewModel});

  final RegisterCubit viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.only(top: 24, left: 32, right: 32),
      child: SizedBox(
        height:300,
        // MediaQuery.orientationOf(context) == Orientation.landscape
        //     ? MediaQuery.sizeOf(context).height * 0.6
        //     : MediaQuery.sizeOf(context).width * 0.8,
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, mainAxisExtent: 45,mainAxisSpacing: 16,crossAxisSpacing: 16),
          children: [
            CustomTextFormFieldRegister(
              onTap: () {
                viewModel.changeGoal(1, 'Gain Weight');
              },
              controller: TextEditingController(),
              enabled: true,
              hintText: 'Gain Weight',
              suffix: Radio<int>(
                  value: 1,
                  groupValue: viewModel.currentRadioGoal,
                  fillColor: WidgetStateProperty.all(ColorManager.white),
                  onChanged: (value) {
                    viewModel.changeGoal(value!, 'Gain Weight');
                    log('$value Gain Weight');
                  }),
            ),
            CustomTextFormFieldRegister(
              onTap: () {
                viewModel.changeGoal(2, 'Lose Weight');
              },
              controller: TextEditingController(),
              enabled: true,
              hintText: 'Lose Weight',
              suffix: Radio<int>(
                  value: 2,
                  groupValue: viewModel.currentRadioGoal,
                  fillColor: WidgetStateProperty.all(ColorManager.white),
                  onChanged: (value) {
                    viewModel.changeGoal(value!, 'Gain Weight');
                    log('$value Gain Weight');
                  }),
            ),
            CustomTextFormFieldRegister(
              onTap: () {
                viewModel.changeGoal(3, 'Get Fitter');
              },
              controller: TextEditingController(),
              enabled: true,
              hintText: 'Get Fitter',
              suffix: Radio(
                  value: 3,
                  groupValue: viewModel.currentRadioGoal,
                  fillColor: WidgetStateProperty.all(ColorManager.white),
                  onChanged: (value) {
                    viewModel.changeGoal(value!, 'Get Fitter');
                    log('$value Get Fitter');
                  }),
            ),
            CustomTextFormFieldRegister(
              onTap: () {
                viewModel.changeGoal(4, 'Gain More Flexible');
              },
              controller: TextEditingController(),
              enabled: true,
              hintText: 'Gain More Flexible',
              suffix: Radio(
                  value: 4,
                  groupValue: viewModel.currentRadioGoal,
                  fillColor: WidgetStateProperty.all(ColorManager.white),
                  onChanged: (value) {
                    viewModel.changeGoal(value!, 'Gain More Flexible');
                    log('$value Gain More Flexible');
                  }),
            ),
            CustomTextFormFieldRegister(
              onTap: () {
                viewModel.changeGoal(5, 'Learn The Basic');
              },
              controller: TextEditingController(),
              enabled: true,
              hintText: 'Learn The Basic',
              suffix: Radio(
                  value: 5,
                  groupValue: viewModel.currentRadioGoal,
                  fillColor: WidgetStateProperty.all(ColorManager.white),
                  onChanged: (value) {
                    viewModel.changeGoal(value!, 'Learn The Basic');
                    log('$value Learn The Basic');
                  }),
            ),
          ],
          // child: Column(
          //   // shrinkWrap: true,
          //   spacing: 16,
          //   children: [
          //     CustomTextFormFieldRegister(
          //       onTap: () {
          //         viewModel.changeGoal(1, 'Gain Weight');
          //       },
          //       controller: TextEditingController(),
          //       enabled: true,
          //       hintText: 'Gain Weight',
          //       suffix: Radio<int>(
          //           value: 1,
          //           groupValue: viewModel.currentRadioGoal,
          //
          //           fillColor: WidgetStateProperty.all(ColorManager.white),
          //           onChanged: (value) {
          //             viewModel.changeGoal(value!, 'Gain Weight');
          //             log('$value Gain Weight');
          //
          //           }),
          //     ),
          //     CustomTextFormFieldRegister(
          //       onTap: () {
          //         viewModel.changeGoal(2, 'Lose Weight');
          //       },
          //       controller: TextEditingController(),
          //       enabled: true,
          //       hintText: 'Lose Weight',
          //       suffix: Radio<int>(
          //
          //           value: 2,
          //           groupValue: viewModel.currentRadioGoal,
          //           fillColor: WidgetStateProperty.all(ColorManager.white),
          //           onChanged: (value) {
          //             viewModel.changeGoal(value! , 'Gain Weight');
          //        log('$value Gain Weight');
          //           }),
          //     ),
          //     CustomTextFormFieldRegister(
          //       onTap: () {
          //         viewModel.changeGoal(3, 'Get Fitter');
          //       },
          //       controller: TextEditingController(),
          //       enabled: true,
          //       hintText: 'Get Fitter',
          //       suffix: Radio(
          //           value: 3,
          //           groupValue: viewModel.currentRadioGoal,
          //           fillColor: WidgetStateProperty.all(ColorManager.white),
          //           onChanged: (value) {
          //             viewModel.changeGoal(value!, 'Get Fitter');
          //             log('$value Get Fitter');
          //           }),
          //     ),
          //     CustomTextFormFieldRegister(
          //       onTap: () {
          //         viewModel.changeGoal(4, 'Gain More Flexible');
          //       },
          //       controller: TextEditingController(),
          //       enabled: true,
          //       hintText: 'Gain More Flexible',
          //       suffix: Radio(
          //           value: 4,
          //           groupValue: viewModel.currentRadioGoal,
          //           fillColor: WidgetStateProperty.all(ColorManager.white),
          //           onChanged: (value) {
          //             viewModel.changeGoal(value!, 'Gain More Flexible');
          //             log('$value Gain More Flexible');
          //           }),
          //     ),
          //     CustomTextFormFieldRegister(
          //       onTap: () {
          //         viewModel.changeGoal(5, 'Learn The Basic');
          //       },
          //       controller: TextEditingController(),
          //       enabled: true,
          //       hintText: 'Learn The Basic',
          //       suffix: Radio(
          //           value: 5,
          //           groupValue: viewModel.currentRadioGoal,
          //           fillColor: WidgetStateProperty.all(ColorManager.white),
          //           onChanged: (value) {
          //             viewModel.changeGoal(value!, 'Learn The Basic');
          //             log('$value Learn The Basic');
          //           }),
          //     ),
          //
          //
          //   ],
          // ),
        ),
      ),
    );
  }
}
