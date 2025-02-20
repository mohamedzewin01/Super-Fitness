import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:super_fitness/core/utils/cashed_data_shared_preferences.dart';
import 'package:super_fitness/features/edit_profile/domain/use_cases/edit_profile_useCase.dart';
import '../../../../core/common/api_result.dart';
import '../../../../core/utils/utilss.dart';
import '../../data/models/edit_profile_request.dart';
import '../../domain/entities/edit_profile_entity.dart';

part 'edite_profile_state.dart';

@injectable
class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this._editProfileUseCase) : super(EditProfileInitial());

  final EditProfileUseCase _editProfileUseCase;

  int currentIndicator = 0;
  bool isMale = false;
  String userGender = '';
  List<int> pageNotCompeted = [];
  int useAge = 25;
  int userWeight = CacheService.getData(key: CacheConstants.weight);
  int useHeight = 167;

  // int initialPage = 0;
  bool isShow = true;
  int currentRadioGoal = 0;
  int totalSteps = 6;
  String currentGoal = CacheService.getData(key: CacheConstants.goal);
  int currentRadioActivityLevel = 0;
  File? logeImageFile;
  final CarouselSliderController? controllerAge = CarouselSliderController();
  TextEditingController firstNameController = TextEditingController(
      text: CacheService.getData(key: CacheConstants.userFirstName));
  TextEditingController lastNameController =
      TextEditingController(text: CacheService.getData(key: CacheConstants.userLastName));
  TextEditingController emailController =
      TextEditingController(text: CacheService.getData(key: CacheConstants.userEmail));

  void doAction(EditProfileScreenIntent intent) {
    switch (intent) {
      case EditProfileIntent():
        // TODO: Handle this case.
        throw UnimplementedError();
      case ChangeAgeIntent():
        _changeAge(intent.age);
      case ChangeWeightIntent():
        changeWeight(intent.weight);
      case ChangeHeightIntent():
        _changeHeight(intent.height);
      case ChangeGoalIntent():
        changeGoal(
          intent.goal,
        );
      case ChangeActivityLevelIntent():
        changeActivityLevel(intent.activityLevel);
      case ChangeUserImageIntent():
        _changeImage(intent.imageFile);
    }
  }

  Future<void> editProfile() async {
    EditProfileRequest editProfileRequest = EditProfileRequest(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        weight: userWeight,
        activityLevel: 'level1',
        goal: currentGoal);
    var result = await _editProfileUseCase.editProfileRepo
        .editProfile(editProfileRequest);

    switch (result) {
      case Success<EditProfileEntity?>():
        if (!isClosed) {
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
    emit(ImageChange());
  }

  void _changeAge(int age) {
    useAge = age;
    emit(AgeChange());
  }

  void changeWeight(int weight) {
    userWeight = weight;
    emit(WeightChange());
  }

  void _changeHeight(int height) {
    useHeight = height;
    emit(HeightChange());
  }

  void changeGoal(int goal) {
    currentRadioGoal = goal;

    log('currentGoal $currentRadioGoal');
    emit(GoalChange());
  }

  void changeActivityLevel(int activityLevel) {
    currentRadioActivityLevel = activityLevel;
    emit(ActivityLevelChange());
  }
}

sealed class EditProfileScreenIntent {}

class EditProfileIntent extends EditProfileScreenIntent {}

class ChangeAgeIntent extends EditProfileScreenIntent {
  final int age;

  ChangeAgeIntent(this.age);
}

class ChangeWeightIntent extends EditProfileScreenIntent {
  final int weight;

  ChangeWeightIntent(this.weight);
}

class ChangeHeightIntent extends EditProfileScreenIntent {
  final int height;

  ChangeHeightIntent(this.height);
}

class ChangeGoalIntent extends EditProfileScreenIntent {
  final int goal;

  ChangeGoalIntent(
    this.goal,
  );
}

class ChangeActivityLevelIntent extends EditProfileScreenIntent {
  final int activityLevel;

  ChangeActivityLevelIntent(this.activityLevel);
}

class ChangeUserImageIntent extends EditProfileScreenIntent {
  final File imageFile;

  ChangeUserImageIntent(this.imageFile);
}
