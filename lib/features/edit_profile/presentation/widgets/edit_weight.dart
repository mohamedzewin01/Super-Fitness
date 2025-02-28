import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:super_fitness/core/resources/app_constants.dart';
import 'package:super_fitness/core/widgets/custom_app_bar.dart';
import 'package:super_fitness/core/widgets/custom_carouse_slider.dart';
import 'package:super_fitness/core/widgets/custom_register_step.dart';
import 'package:super_fitness/features/edit_profile/presentation/widgets/custom_background.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/utils/cashed_data_shared_preferences.dart';
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
            CustomAppBar(
              isLogo: true,
              onTap: () {
                widget.viewModel.editProfile();
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: AppSize.s102,
            ),
            CustomRegisterStep(
                title: AppLocalizations.of(context)!.whatIsYourWeight,
                subTitle: AppLocalizations.of(context)!
                    .thisHelpsUsCreateYourPersonalizedPlan,
                isNotShowButton: false,
                onPressed: () async {
                  await CacheService.setData(
                      key: CacheConstants.weight,
                      value: widget.viewModel.userWeight);
                  widget.viewModel.editProfile();
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
                bodyScreen: CustomCarouseSlider(
                  items: AppConstants.weightList,
                  carouselController: widget.viewModel.controllerAge,
                  initialPage: widget.viewModel.userWeight,
                  title: AppLocalizations.of(context)!.kg,
                  onPageChanged: (index) {
                    setState(() {
                      widget.viewModel.doAction(ChangeWeightIntent(index));
                      log('weight is $index');
                    });
                  },
                ),
                titleButton: AppLocalizations.of(context)!.done),
          ],
        ),
      ),
    );
  }
}
