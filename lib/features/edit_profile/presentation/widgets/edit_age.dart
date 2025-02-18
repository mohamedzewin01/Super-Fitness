import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:super_fitness/core/resources/app_constants.dart';
import 'package:super_fitness/core/widgets/custom_carouse_slider.dart';
import 'package:super_fitness/core/widgets/custom_register_step.dart';
import 'package:super_fitness/features/edit_profile/presentation/widgets/custom_backgroung.dart';

import '../../../../core/resources/assets_manager.dart';
import '../manager/edit_profile_cubit.dart';

class EditeAgeView extends StatefulWidget {
  const EditeAgeView({super.key, required this.viewModel});
  final EditProfileCubit viewModel;

  @override
  State<EditeAgeView> createState() => _EditeAgeViewState();
}

class _EditeAgeViewState extends State<EditeAgeView> {
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      assetsImagePng: AssetsManager.backgroundEditProfile1,
      body: SingleChildScrollView(
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
              height: 102,
            ),
            CustomRegisterStep(
                title: 'what is your weight ?',
                subTitle: 'this helps us create Your personalized plan',
                isNotShowButton: false,
                onPressed: () {
               Navigator.pop(context);
                },
                bodyScreen: CustomCarouseSlider(
                  items: AppConstants.ageList,
                  carouselController:widget.viewModel.controllerAge ,
                  initialPage: widget.viewModel.useAge,
                  title:"Year" ,
                  onPageChanged:(index) {
                    setState(() {
                      widget.viewModel.doAction(ChangeAgeIntent(index));
                      log('Age is $index');
                    });

                  } ,
                ),
                titleButton: 'Done'),
          ],
        ),
      ),
    );

  }
}
