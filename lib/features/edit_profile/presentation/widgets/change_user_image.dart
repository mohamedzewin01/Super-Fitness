import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/resources/app_constants.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../manager/edit_profile_cubit.dart';

class ChangeUserImage extends StatelessWidget {
  const ChangeUserImage({
    super.key,
    required this.viewModel,
  });

  final EditProfileCubit viewModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CustomDialog.showDialogAddImage(context, camera: () async {
          XFile? xFile =
              await ImagePicker().pickImage(source: ImageSource.camera);
          if (xFile != null) {
            viewModel.doAction(ChangeUserImageIntent(File(xFile.path)));
          }
        }, gallery: () async {
          XFile? xFile =
              await ImagePicker().pickImage(source: ImageSource.gallery);
          if (xFile != null) {
            viewModel.doAction(ChangeUserImageIntent(File(xFile.path)));
          }
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(0),
            clipBehavior: Clip.antiAlias,
            height: 103,
            width: 103,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
                color: ColorManager.primary,
              boxShadow: [
                BoxShadow(
                  color: ColorManager.orange.withAlpha(65),
                  blurRadius: 10,
                  spreadRadius: 3,
                  offset: Offset(0, 0),
                ),
              ]
            ),
            child: viewModel.logeImageFile != null
                ? Image.file(
                    viewModel.logeImageFile!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )
                : Image.asset(
                    AssetsManager.userImageDefault,
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.asset(
              AssetsManager.editImage,
              width: AppSize.s20,
              height: AppSize.s20,
            ),
          ),
        ],
      ),
    );
  }
}
