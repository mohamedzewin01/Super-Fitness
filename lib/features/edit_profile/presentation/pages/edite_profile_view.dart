import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:super_fitness/core/di/di.dart';
import 'package:super_fitness/core/resources/color_manager.dart';
import 'package:super_fitness/core/resources/style_manager.dart';
import 'package:super_fitness/core/resources/values_manager.dart';
import 'package:super_fitness/core/utils/cashed_data_shared_preferences.dart';
import 'package:super_fitness/core/widgets/custom_text_form_field.dart';
import 'package:super_fitness/features/edit_profile/presentation/widgets/custom_background.dart';
import '../../../../core/functions/helper.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../manager/edit_profile_cubit.dart';
import '../widgets/change_user_image.dart';
import '../widgets/custom_filed.dart';
import '../widgets/edit_activity_level.dart';
import '../widgets/edit_goal.dart';
import '../widgets/edit_weight.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditeProfileView extends StatefulWidget {
  const EditeProfileView({super.key});

  @override
  State<EditeProfileView> createState() => _EditeProfileViewState();
}

class _EditeProfileViewState extends State<EditeProfileView> {
  late EditProfileCubit viewModel;

  @override
  initState() {
    viewModel = getIt.get<EditProfileCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      assetsImagePng: AssetsManager.backgroundEditProfile,
      body: BlocProvider(
        create: (context) => viewModel,
        child: BlocBuilder<EditProfileCubit, EditProfileState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                children: [
                  CustomAppBar(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    isLogo: false,
                    title: AppLocalizations.of(context)!.editProfile,
                    // 'Edit Profile',
                  ),
                  SizedBox(height: AppSize.s20),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppPadding.p24),
                      child: Form(
                        key: viewModel.formKey,
                        child: ListView(
                          children: [
                            ChangeUserImage(viewModel: viewModel),
                            SizedBox(
                              height: AppSize.s8,
                            ),
                            Center(
                              child: Text(
                                '${viewModel.firstNameController.text.toUpperCase()} '
                                '${viewModel.lastNameController.text.toUpperCase()}',
                                style: getBoldStyle(
                                    color: ColorManager.white,
                                    fontSize: AppSize.s20),
                              ),
                            ),
                            Column(
                              spacing: AppSize.s16,
                              children: [
                                SizedBox(
                                  height: AppSize.s16,
                                ),
                                CustomTextFormField(
                                  controller: viewModel.firstNameController,
                                  onChanged: (p0) {
                                    if (viewModel.formKey.currentState!
                                        .validate()) {
                                      viewModel.editProfile();

                                    }
                                  },
                                  validator: (value) => validateString(
                                    value: value!,
                                    messageLength: AppLocalizations.of(context)!
                                        .messageLength3,
                                    messageInvalid:
                                        AppLocalizations.of(context)!
                                            .invalidInput,
                                    message: AppLocalizations.of(context)!
                                        .entervalidLastName,
                                  ),
                                  prefixIcon: SizedBox(
                                    height: AppSize.s20,
                                    width: AppSize.s20,
                                    child: Center(
                                      child: SvgPicture.asset(
                                        AssetsManager.user,
                                      ),
                                    ),
                                  ),
                                ),
                                CustomTextFormField(
                                  controller: viewModel.lastNameController,
                                  onChanged: (p0) {
                                    if (viewModel.formKey.currentState!
                                        .validate()) {
                                      viewModel.editProfile();
                                    }
                                  },
                                  validator: (value) => validateString(
                                    value: value!,
                                    messageLength: AppLocalizations.of(context)!
                                        .messageLength3,
                                    messageInvalid:
                                        AppLocalizations.of(context)!
                                            .invalidInput,
                                    message: AppLocalizations.of(context)!
                                        .entervalidLastName,
                                  ),
                                  prefixIcon: SizedBox(
                                    height: AppSize.s20,
                                    width: AppSize.s20,
                                    child: Center(
                                      child: SvgPicture.asset(
                                        AssetsManager.user,
                                      ),
                                    ),
                                  ),
                                ),
                                CustomTextFormField(
                                  enabled: true,
                                  controller: viewModel.emailController,
                                  onChanged: (p0) {
                                    /// I don't think the user can change the email.
                                    // if(viewModel.formKey.currentState!
                                    //     .validate()){
                                    //   viewModel.editProfile();
                                    // }
                                  },
                                  validator: (value) => validateEmail(
                                    value: value!,
                                    message: AppLocalizations.of(context)!
                                        .emailIsEmpty,
                                    messageInvalid:
                                        AppLocalizations.of(context)!
                                            .enterValidEmail,
                                  ),
                                  prefixIcon: SizedBox(
                                    height: AppSize.s20,
                                    width: AppSize.s20,
                                    child: Center(
                                      child: SvgPicture.asset(
                                        AssetsManager.mail,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            CustomFiled(
                              text:
                                  "${viewModel.userWeight} ${AppLocalizations.of(context)!.kg}",
                              title: AppLocalizations.of(context)!.yourWeight,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EditeWeightView(viewModel: viewModel),
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: AppSize.s16,
                            ),
                            CustomFiled(
                              text: AppLocalizations.of(context)!.goalLevel(
                                (viewModel.currentRadioGoal + AppSizeInt.s1)
                                    .toString(),
                              ),
                              title: AppLocalizations.of(context)!.yourGoal,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EditGoalView(viewModel: viewModel),
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: AppSize.s16,
                            ),
                            CustomFiled(
                              text: AppLocalizations.of(context)!.activityLevel(
                                (viewModel.currentActivityLevel + AppSizeInt.s1)
                                    .toString()
                                    .toUpperCase(),
                              ),
                              title: AppLocalizations.of(context)!
                                  .yourActivityLevel,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditActivityLevelView(
                                        viewModel: viewModel),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
