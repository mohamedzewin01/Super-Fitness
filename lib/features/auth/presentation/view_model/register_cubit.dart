import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(ViewModelInitial());

  int currentIndicator = 0;
  bool isMale = false;
  String userGender = '';
  int useAge = 25;
  int useWeight = 90;
  int useHeight = 167;
  int initialPage = 0;
  int currentRadioGoal = 0;
  int totalSteps = 6;
  String currentGoal = '';
  int currentRadioActivityLevel = 0;
  String currentActivityLevel = '';

  final PageController pageController = PageController(initialPage: 0);
  final CarouselSliderController? controllerAge = CarouselSliderController();
  final CarouselSliderController? controllerWeight = CarouselSliderController();
  final CarouselSliderController? controllerHeight = CarouselSliderController();
  void changeIndicator(int index) {
    currentIndicator = index;
    emit(IndicatorChanged());
  }

  void changeGender(bool gender) {
    isMale = gender;
    if (gender) {
      userGender = 'male';
    } else {
      userGender = 'female';
    }
    emit(GenderChanged());
  }
  void changeAge(int age) {
    useAge = age;
    emit(AgeChange());
  }

  void changeWeight(int weight) {
    useWeight = weight;
    emit(WeightChange());
  }

  void changeHeight(int height) {
    useHeight = height;
    emit(HeightChange());
  }
  void changeGoal(int goal,String goalName) {
    currentRadioGoal = goal;
    currentGoal = goalName;
    log('$currentRadioGoal currentGoal');
    emit(GoalChange());
  }
  void changeActivityLevel(int activityLevel,String activityLevelName) {
    currentRadioActivityLevel = activityLevel;
    currentActivityLevel = activityLevelName;
    emit(ActivityLevelChange());
  }

}
