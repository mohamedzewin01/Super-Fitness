import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../../data/models/register_models/register_request.dart';
import '../../../domain/entities/register_entities.dart';
import '../../../domain/use_cases/register_usecase.dart';

import '../../../../../core/common/api_result.dart';

part 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerUseCase) : super(ViewModelInitial());
  final RegisterUseCase registerUseCase;

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
  bool isPassword = false;
  bool isRePassword = false;
  // String currentActivityLevel = '';
  final formKey = GlobalKey<FormState>();
  final PageController pageController = PageController(initialPage: 0);
  final CarouselSliderController? controllerAge = CarouselSliderController();
  final CarouselSliderController? controllerWeight = CarouselSliderController();
  final CarouselSliderController? controllerHeight = CarouselSliderController();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  void doAction(RegisterScreenIntent intent) {
    switch (intent) {
      case RegisterIntentRegister():
        _register();
      case ShowBackIntent():
        _showBack(isShowBack: intent.isShowBack);
      case IsPasswordChangedIntent():
        _isPasswordChanged();
      case IsRePasswordChangedIntent():
        _isRePasswordChanged();
      case ChangeIndicatorIntent():
        _changeIndicator(intent.index);
      case ChangeGenderIntent():
        _changeGender(intent.gender);
      case ChangeAgeIntent():
        _changeAge(intent.age);
      case ChangeWeightIntent():
        _changeWeight(intent.weight);
      case ChangeHeightIntent():
        _changeHeight(intent.height);
      case ChangeGoalIntent():
        _changeGoal(intent.goal, intent.goalName);
      case ChangeActivityLevelIntent():
        _changeActivityLevel(intent.activityLevel);
    }
  }

  void _showBack({required bool isShowBack}) {
    isShow = isShowBack;
    emit(ShowBack());
  }

  void _isPasswordChanged() {
    isPassword = !isPassword;
    emit(IsPasswordChanged());
  }

  void _isRePasswordChanged() {
    isRePassword = !isRePassword;
    emit(IsRePasswordChanged());
  }

  void _changeIndicator(int index) {
    currentIndicator = index;
    emit(IndicatorChanged());
  }

  void _changeGender(bool gender) {
    isMale = gender;
    if (gender) {
      userGender = 'male';
    } else {
      userGender = 'female';
    }
    emit(GenderChanged());
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

  void _changeActivityLevel(int activityLevel) {
    currentRadioActivityLevel = activityLevel;
    emit(ActivityLevelChange());
  }

  Future<void> _register() async {
    emit(LoadingRegisterState());
    RegisterModelRequest registerModelRequest = RegisterModelRequest(
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      rePassword: rePasswordController.text.trim(),
      gender: userGender,
      age: useAge,
      weight: useWeight,
      height: useHeight,
      activityLevel: 'level$currentRadioActivityLevel',
      goal: currentGoal,
    );
    var result = await registerUseCase.register(registerModelRequest);

    print("API Result: $result");
    print("=======================================");

    switch (result) {
      case Success<RegisterEntity?>():
        emit(SuccessRegisterState(result.data!));

      case Fail<RegisterEntity?>():
        emit(ErrorRegisterState(result.exception));
    }
  }
}

sealed class RegisterScreenIntent {}

class RegisterIntentRegister extends RegisterScreenIntent {}

class ShowBackIntent extends RegisterScreenIntent {
  final bool isShowBack;
  ShowBackIntent(this.isShowBack);
}

class IsPasswordChangedIntent extends RegisterScreenIntent {}

class IsRePasswordChangedIntent extends RegisterScreenIntent {}

class ChangeIndicatorIntent extends RegisterScreenIntent {
  final int index;
  ChangeIndicatorIntent(this.index);
}

class ChangeGenderIntent extends RegisterScreenIntent {
  final bool gender;
  ChangeGenderIntent(this.gender);
}

class ChangeAgeIntent extends RegisterScreenIntent {
  final int age;
  ChangeAgeIntent(this.age);
}

class ChangeWeightIntent extends RegisterScreenIntent {
  final int weight;
  ChangeWeightIntent(this.weight);
}

class ChangeHeightIntent extends RegisterScreenIntent {
  final int height;
  ChangeHeightIntent(this.height);
}

class ChangeGoalIntent extends RegisterScreenIntent {
  final int goal;
  final String goalName;
  ChangeGoalIntent(this.goal, this.goalName);
}

class ChangeActivityLevelIntent extends RegisterScreenIntent {
  final int activityLevel;
  ChangeActivityLevelIntent(this.activityLevel);
}
