import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:super_fitness/core/resources/app_constants.dart';
import 'package:super_fitness/core/widgets/custom_app_bar.dart';
import 'package:super_fitness/core/widgets/custom_carouse_slider.dart';
import 'package:super_fitness/core/widgets/custom_register_step.dart';
import 'package:super_fitness/features/edit_profile/presentation/widgets/custom_background.dart';

import '../../../../core/resources/assets_manager.dart';
import '../manager/edit_profile_cubit.dart';

class EditeWeightView extends StatefulWidget {
  const EditeWeightView({super.key, required this.viewModel});
  final EditProfileCubit viewModel;

  @override
  State<EditeWeightView> createState() => _EditeWeightViewState();
}

class _EditeWeightViewState extends State<EditeWeightView> {
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      assetsImagePng: AssetsManager.backgroundEditProfile1,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(isLogo: true,onTap: () => Navigator.pop(context),),
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
                  items: AppConstants.weightList,
                  carouselController:widget.viewModel.controllerAge ,
                  initialPage: widget.viewModel.useWeight,
                  title:"Kg" ,
                  onPageChanged:(index) {
                    setState(() {
                      widget.viewModel.changeWeight(index);
                      log('weight is $index');
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
