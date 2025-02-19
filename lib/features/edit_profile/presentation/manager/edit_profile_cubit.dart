import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'edite_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());
  int currentIndicator = 0;
  bool isMale = false;
  String userGender = '';
  List<int> pageNotCompeted = [];
  int useAge = 25;
  int useWeight = 90;
  int useHeight = 167;
  // int initialPage = 0;
  bool isShow = true;
  int currentRadioGoal = 0;
  int totalSteps = 6;
  String currentGoal = '';
  int currentRadioActivityLevel = 0;
  File? logeImageFile;
  final CarouselSliderController? controllerAge = CarouselSliderController();
  final CarouselSliderController? controllerWeight = CarouselSliderController();
  final CarouselSliderController? controllerHeight = CarouselSliderController();

  TextEditingController firstNameController = TextEditingController(text: 'mohammed');
  TextEditingController lastNameController = TextEditingController(text: 'zewin');
  TextEditingController emailController = TextEditingController(text: 'V7Kt9@example.com');

  void doAction(EditProfileScreenIntent intent) {
    switch (intent) {

      case EditProfileIntent():
        // TODO: Handle this case.
        throw UnimplementedError();
      case ChangeAgeIntent():
        _changeAge(intent.age);
      case ChangeWeightIntent():
        _changeWeight(intent.weight);
      case ChangeHeightIntent():
        _changeHeight(intent.height);
      case ChangeGoalIntent():
        _changeGoal(intent.goal, intent.goalName);
      case ChangeActivityLevelIntent():
        changeActivityLevel(intent.activityLevel);
      case ChangeUserImageIntent():
        _changeImage(intent.imageFile);
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
  void _changeWeight(int weight) {
    useWeight = weight;
    emit(WeightChange());
  }
  void _changeHeight(int height) {
    useHeight = height;
    emit(HeightChange());
  }
  void _changeGoal(int goal, String goalName) {
    currentRadioGoal = goal;
    currentGoal = goalName;
    log('currentGoal $currentRadioGoal');
    emit(GoalChange());
  }
  void changeActivityLevel(int activityLevel) {
    currentRadioActivityLevel = activityLevel;
    emit(ActivityLevelChange());
  }
}
