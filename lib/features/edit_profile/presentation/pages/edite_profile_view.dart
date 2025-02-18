import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_fitness/core/resources/color_manager.dart';
import 'package:super_fitness/core/widgets/custom_elevated_button.dart';
import 'package:super_fitness/features/edit_profile/presentation/widgets/custom_backgroung.dart';

import '../../../../core/resources/assets_manager.dart';
import '../manager/edit_profile_cubit.dart';
import '../widgets/edit_activity_level.dart';
import '../widgets/edit_age.dart';

class EditeProfileView extends StatefulWidget {
  const EditeProfileView({super.key});

  @override
  State<EditeProfileView> createState() => _EditeProfileViewState();
}

class _EditeProfileViewState extends State<EditeProfileView> {
  late EditProfileCubit viewModel;

  @override
  initState() {
    viewModel = EditProfileCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: CustomBackground(
        assetsImagePng: AssetsManager.backgroundEditProfile,
        body: Padding(
          padding: const EdgeInsets.all(22.0),
          child: BlocConsumer<EditProfileCubit, EditProfileState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 16,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                            buttonColor: ColorManager.orange,
                            title: 'age ${viewModel.useAge}',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditeAgeView(
                                      viewModel: viewModel,
                                    ),
                                  ));
                            }),
                      ),
                    ],
                  ),
                  CustomElevatedButton(
                      buttonColor: ColorManager.orange,
                      title: 'goal',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditActivityLevelView(viewModel: viewModel,),
                            ));
                      }),
                  CustomElevatedButton(
                      buttonColor: ColorManager.orange,
                      title: 'activity level',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditActivityLevelView(viewModel: viewModel,),
                            ));
                      }),

                  ///TODO: implement EditeProfileView
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
