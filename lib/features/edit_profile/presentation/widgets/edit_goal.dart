import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:super_fitness/core/resources/app_constants.dart';
import 'package:super_fitness/core/widgets/custom_text_form_field.dart';
import 'package:super_fitness/features/edit_profile/presentation/manager/edit_profile_cubit.dart';
import 'package:super_fitness/features/edit_profile/presentation/widgets/custom_background.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditGoalView extends StatefulWidget {
  const EditGoalView({super.key, required this.viewModel});

  final EditProfileCubit viewModel;

  @override
  State<EditGoalView> createState() => _EditGoalViewState();
}

class _EditGoalViewState extends State<EditGoalView> {
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      assetsImagePng: AssetsManager.backgroundEditProfile1,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(AppSize.s8),
                child: CustomAppBar(
                    isLogo: true, onTap: () => Navigator.pop(context))),
            SizedBox(
              height: AppSize.s40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
              child: Column(
                spacing: AppSize.s8,
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      AppLocalizations.of(context)!.whatIsYourGoal,
                      style: getSemiBoldStyle(
                          color: Colors.white, fontSize: AppSize.s20),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      AppLocalizations.of(context)!
                          .thisHelpsUsCreateYourPersonalizedPlan,
                      style: getRegularStyle(
                          color: Colors.white, fontSize: AppSize.s20),
                    ),
                  ),
                ],
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
                      AppSizeInt.s5,
                      (index) => Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: AppSize.s32),
                        child: CustomTextFormFieldRegister(
                          value: index,
                          groupValue: widget.viewModel.currentRadioGoal,
                          onChangeRadio: (index) {
                            widget.viewModel.doAction(ChangeGoalIntent(index!));
                          },
                          enabled: true,
                          hintText: AppLocalizations.of(context)!
                              .goalLevel((index + 1).toString()),
                          // AppConstants.goal[index],
                          onTap: () {
                            setState(() {});
                            widget.viewModel.doAction(ChangeGoalIntent(index));
                            log(AppConstants.goal[index]);
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
                              widget.viewModel.editProfile();
                              Navigator.pop(context);
                            },
                          ),
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
