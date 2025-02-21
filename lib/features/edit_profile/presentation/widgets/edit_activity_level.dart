import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:super_fitness/core/resources/app_constants.dart';
import 'package:super_fitness/core/resources/values_manager.dart';
import 'package:super_fitness/core/widgets/custom_text_form_field.dart';
import 'package:super_fitness/features/edit_profile/presentation/manager/edit_profile_cubit.dart';
import 'package:super_fitness/features/edit_profile/presentation/widgets/custom_background.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              padding: const EdgeInsets.all(AppPadding.p8),
              child: CustomAppBar(
                  isLogo: true, onTap: () => Navigator.pop(context)),
            ),
            SizedBox(
              height: AppSize.s40,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(AppSize.s24),
                child: Text(
                  AppLocalizations.of(context)!
                      .yourRegularPhysicalActivityLevel,
                  style: getSemiBoldStyle(
                      color: Colors.white, fontSize: AppSize.s20),
                ),
              ),
            ),
            SizedBox(
              height: AppSize.s16,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: AppSize.s24),
              decoration: BoxDecoration(
                color: ColorManager.primary.withAlpha(AppSizeInt.s150),
                borderRadius: BorderRadius.circular(AppSize.s20),
              ),
              child: Column(
                children: [
                  Column(
                    spacing: AppSize.s16,
                    children: List.generate(
                      5,
                      (index) => Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: AppSize.s32),
                        child: CustomTextFormFieldRegister(
                          value: index,
                          groupValue: widget.viewModel.currentActivityLevel,
                          onChangeRadio: (index) {
                            widget.viewModel
                                .doAction(ChangeLevelIntent(index!));
                          },
                          enabled: true,
                          hintText: AppLocalizations.of(context)!
                              .activityLevel((index + 1).toString()),
                          onTap: () {
                            setState(() {});
                            widget.viewModel.doAction(ChangeLevelIntent(index));
                            log(AppConstants.activityLevel[
                                widget.viewModel.currentActivityLevel]);
                          },
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: AppSize.s16,
                            left: AppSize.s16,
                            right: AppSize.s16,
                          ),
                          child: CustomElevatedButton(
                              buttonColor: ColorManager.orange,
                              title: AppLocalizations.of(context)!.done,
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
