import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:super_fitness/core/resources/color_manager.dart';
import 'package:super_fitness/core/resources/style_manager.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../view_model/register_cubit.dart';

class CustomActivityLevel extends StatefulWidget {
  const CustomActivityLevel({super.key, required this.viewModel});

  final RegisterCubit viewModel;

  @override
  State<CustomActivityLevel> createState() => _CustomActivityLevelState();
}

class _CustomActivityLevelState extends State<CustomActivityLevel> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).width*0.84,
        child: SingleChildScrollView(
          child: Column(
            // shrinkWrap: true,
            spacing: 16,
            children: [
              CustomTextFormFieldRegister(
                onTap: () {
                  setState(() {});
                  selectedIndex = 1;
                },
                controller: TextEditingController(),
                enabled: true,
                hintText: 'Rookie',
                suffix: Radio(
                    value: 1,
                    groupValue: selectedIndex,
                    fillColor: WidgetStateProperty.all(ColorManager.white),
                    onChanged: (value) {
                      setState(() {
                        setState(() {});
                        selectedIndex = value as int;
                        log('Rookie $selectedIndex');
                      });
                    }),
              ),
              CustomTextFormFieldRegister(
                onTap: () {
                  setState(() {});
                  selectedIndex = 2;
                },
                controller: TextEditingController(),
                enabled: true,
                hintText: 'Beginner',
                suffix: Radio(
                    value: 2,
                    groupValue: selectedIndex,
                    fillColor: WidgetStateProperty.all(ColorManager.white),
                    onChanged: (value) {
                      setState(() {
                        selectedIndex = value as int;
                        log('Beginner $selectedIndex');
                      });
                    }),
              ),
              CustomTextFormFieldRegister(
                onTap: () {
                  setState(() {});
                  selectedIndex = 3;
                },
                controller: TextEditingController(),
                enabled: true,
                hintText: 'Intermediate',
                suffix: Radio(
                    value: 3,
                    groupValue: selectedIndex,
                    fillColor: WidgetStateProperty.all(ColorManager.white),
                    onChanged: (value) {
                      setState(() {
                        selectedIndex = value as int;
                        log('Intermediate $selectedIndex');
                      });
                    }),
              ),
              CustomTextFormFieldRegister(
                onTap: () {
                  setState(() {
                    selectedIndex = 4;
                  });
                },
                controller: TextEditingController(),
                enabled: true,
                hintText: 'Advance',
                suffix: Radio(
                    value: 4,
                    groupValue: selectedIndex,
                    fillColor: WidgetStateProperty.all(ColorManager.white),
                    onChanged: (value) {
                      setState(() {
                        selectedIndex = value as int;
                        log('Advance $selectedIndex');
                      });
                    }),
              ),
              CustomTextFormFieldRegister(
                onTap: () {
                  setState(() {});
                  selectedIndex = 5;
                },
                controller: TextEditingController(),
                enabled: true,
                hintText: 'True Beast',
                suffix: Radio(
                    value: 5,
                    groupValue: selectedIndex,
                    fillColor: WidgetStateProperty.all(ColorManager.white),
                    onChanged: (value) {
                      setState(() {
                        selectedIndex = value as int;
                        log('True Beast $selectedIndex');
                      });
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
