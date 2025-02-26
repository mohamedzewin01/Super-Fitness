import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:super_fitness/core/resources/values_manager.dart';
import 'package:super_fitness/core/utils/cashed_data_shared_preferences.dart';
import 'package:super_fitness/features/edit_profile/domain/use_cases/edit_profile_useCase.dart';
import '../../../../core/api/upload_image_api.dart';
import '../../../../core/common/api_result.dart';
import '../../../../core/resources/app_constants.dart';
import '../../data/models/edit_profile_request.dart';
import '../../domain/entities/edit_profile_entity.dart';
part 'edite_profile_state.dart';

@injectable
class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this._editProfileUseCase) : super(EditProfileInitial());

  final EditProfileUseCase _editProfileUseCase;

  int userWeight = CacheService.getData(key: CacheConstants.weight);
  int currentRadioGoal = AppConstants.goal
      .indexOf(CacheService.getData(key: CacheConstants.goal));
  String userGoal = CacheService.getData(key: CacheConstants.goal);

  File? logeImageFile;
  String urlImage = CacheService.getData(key: CacheConstants.userImage);
  int currentActivityLevel = AppConstants.activityLevelBackend
      .indexOf(CacheService.getData(key: CacheConstants.activityLevel));

  final formKey = GlobalKey<FormState>();
  final CarouselSliderController? controllerAge = CarouselSliderController();
  TextEditingController firstNameController = TextEditingController(
      text: CacheService.getData(key: CacheConstants.userFirstName));
  TextEditingController lastNameController = TextEditingController(
      text: CacheService.getData(key: CacheConstants.userLastName));
  TextEditingController emailController = TextEditingController(
      text: CacheService.getData(key: CacheConstants.userEmail));

  void doAction(EditProfileScreenIntent intent) {
    switch (intent) {
      case EditProfileIntent():
        editProfile();
      case ChangeWeightIntent():
        _changeWeight(intent.weight);
      case ChangeGoalIntent():
        _changeGoal(intent.goal);
      case ChangeUserImageIntent():
        _changeImage(intent.imageFile);
      case ChangeLevelIntent():
        _changeActivityLevel(intent.activityLevel);
    }
  }

  UploadImageApiManger imageApiManger = UploadImageApiManger();

  Future<void> editProfile() async {
    EditProfileRequest editProfileRequest = EditProfileRequest(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        weight: userWeight,
        activityLevel: 'level${currentActivityLevel + AppSizeInt.s1}',
        goal: userGoal);
    var result = await _editProfileUseCase.editProfileRepo
        .editProfile(editProfileRequest);

    switch (result) {
      case Success<EditProfileEntity?>():
        if (!isClosed) {
          CacheService.setData(key: CacheConstants.userFirstName, value: firstNameController.text);
          CacheService.setData(key: CacheConstants.userLastName, value: lastNameController.text);
          CacheService.setData(key: CacheConstants.userEmail, value: emailController.text);
          emit(SuccessEditProfileState(result.data!));
          log('Success');
        }

      case Fail<EditProfileEntity?>():
        if (!isClosed) {
          emit(ErrorEditProfileState(result.exception));
          // var message = extractErrorMessage(result.exception);
          log(result.exception.toString());
        }
    }
  }

  void _changeImage(File image) {
    logeImageFile = image;
    imageApiManger.uploadImage(imageFile: logeImageFile!);
    emit(ImageChange());
  }

  void _changeWeight(int weight) {
    userWeight = weight;
    emit(WeightChange());
  }

  void _changeGoal(int goal) {
    currentRadioGoal = goal;
    userGoal = AppConstants.goal[goal];

    log('currentGoal $currentRadioGoal');
    emit(GoalChange());
  }

  void _changeActivityLevel(int activityLevel)
  {
    currentActivityLevel = activityLevel;
    currentActivityLevel =
        AppConstants.activityLevelBackend.indexOf("level${activityLevel + AppSizeInt.s1}");
    log("userActivityLevel  ====> $currentActivityLevel");
    editProfile();
    emit(ActivityLevelChange());
  }
}

sealed class EditProfileScreenIntent {}

class EditProfileIntent extends EditProfileScreenIntent {

}

class ChangeWeightIntent extends EditProfileScreenIntent {
  final int weight;

  ChangeWeightIntent(this.weight);
}

class ChangeGoalIntent extends EditProfileScreenIntent {
  final int goal;

  ChangeGoalIntent(
    this.goal,
  );
}

class ChangeLevelIntent extends EditProfileScreenIntent {
  final int activityLevel;

  ChangeLevelIntent(this.activityLevel);
}

class ChangeUserImageIntent extends EditProfileScreenIntent {
  final File imageFile;

  ChangeUserImageIntent(this.imageFile);
}
