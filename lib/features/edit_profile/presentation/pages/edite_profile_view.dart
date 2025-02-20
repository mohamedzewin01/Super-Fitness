import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:super_fitness/core/di/di.dart';
import 'package:super_fitness/core/resources/app_constants.dart';
import 'package:super_fitness/core/resources/color_manager.dart';
import 'package:super_fitness/core/resources/style_manager.dart';
import 'package:super_fitness/core/resources/values_manager.dart';
import 'package:super_fitness/core/widgets/custom_dialog.dart';
import 'package:super_fitness/core/widgets/custom_elevated_button.dart';
import 'package:super_fitness/core/widgets/custom_text_form_field.dart';
import 'package:super_fitness/features/edit_profile/presentation/widgets/custom_background.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../manager/edit_profile_cubit.dart';
import '../widgets/change_user_image.dart';
import '../widgets/edit_activity_level.dart';
import '../widgets/edit_goal.dart';
import '../widgets/edit_weight.dart';
import 'package:image_picker/image_picker.dart';

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
    return BlocProvider(
      create: (context) => viewModel,
      child: CustomBackground(
        assetsImagePng: AssetsManager.backgroundEditProfile,
        body: BlocConsumer<EditProfileCubit, EditProfileState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Column(
              children: [
                CustomAppBar(
                  onTap: () {
                    ///  toDo: Navigator.pop(context);
                  },
                  isLogo: false,
                  title: 'Edit Profile',
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: ListView(
                      children: [
                        ChangeUserImage(viewModel: viewModel),
                        Center(
                          child: Text(
                            '${viewModel.firstNameController.text} ${viewModel.lastNameController.text}',
                            style: getBoldStyle(
                                color: ColorManager.white, fontSize: 20),
                          ),
                        ),
                        Column(
                          spacing: 16,
                          children: [
                            SizedBox(
                              height: 24,
                            ),
                            CustomTextFormField(
                              controller: viewModel.firstNameController,
                              onChanged: (p0) {
                                viewModel.editProfile();
                              },
                              prefixIcon: SizedBox(
                                height: 20,
                                width: 20,
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
                                viewModel.editProfile();
                              },
                              prefixIcon: SizedBox(
                                height: 20,
                                width: 20,
                                child: Center(
                                  child: SvgPicture.asset(
                                    AssetsManager.user,
                                  ),
                                ),
                              ),
                            ),
                            CustomTextFormField(
                              controller: viewModel.emailController,
                              onChanged: (p0) {
                                viewModel.editProfile();
                              },
                              prefixIcon: SizedBox(
                                height: 20,
                                width: 20,
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
                          text: "${viewModel.userWeight} kg",
                          title1: 'Your Weight',
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
                          height: 16,
                        ),
                        CustomFiled(

                          text: "${AppConstants.goal[viewModel.currentRadioGoal ]} ",
                          title1: 'Your Goal',
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
                          height: 16,
                        ),
                        CustomFiled(
                          text: "${AppConstants.activityLevel[viewModel.currentRadioActivityLevel ]} ",
                          title1: 'Your activity level',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditActivityLevelView(viewModel: viewModel),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class CustomFiled extends StatelessWidget {
  const CustomFiled({
    super.key,
    required this.text,
    required this.title1,
    this.onTap,
  });


  final String text;
  final String title1;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              '$title1 (',
              style: getBoldStyle(color: ColorManager.white, fontSize: 14),
            ),
            GestureDetector(
                onTap: onTap,
                child: Text(
                  'tap To Edit',
                  style: getBoldStyle(color: ColorManager.orange, fontSize: 14),
                )),
            Text(
              ')',
              style: getBoldStyle(color: ColorManager.white, fontSize: 14),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          height: 40,
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          decoration: BoxDecoration(
              color: ColorManager.white.withAlpha(50),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                  color: ColorManager.placeHolderColor.withAlpha(150),
                  width: 1.5)),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              textAlign: TextAlign.left,
              style: getBoldStyle(color: ColorManager.white),
            ),
          ),
        ),
      ],
    );
  }
}

// class TitleWeight extends StatelessWidget {
//   const TitleWeight({
//     super.key,
//     required this.title1,
//     this.onTap,
//   });
//
//   final String title1;
//
//   final void Function()? onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Text(
//           '$title1 (',
//           style: getBoldStyle(color: ColorManager.white, fontSize: 14),
//         ),
//         GestureDetector(
//             onTap: onTap,
//             child: Text(
//               'tap To Edit',
//               style: getBoldStyle(color: ColorManager.orange, fontSize: 14),
//             )),
//         Text(
//           ')',
//           style: getBoldStyle(color: ColorManager.white, fontSize: 14),
//         ),
//       ],
//     );
//   }
// }
