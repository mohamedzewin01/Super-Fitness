import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:super_fitness/features/auth/data/models/register_models/register_request.dart';
import 'package:super_fitness/features/auth/domain/entities/register_entities.dart';
import 'package:super_fitness/features/auth/domain/use_cases/register_usecase.dart';

import '../../../../../core/common/api_result.dart';
part 'register_state.dart';


@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerUseCase) : super(ViewModelInitial());
final RegisterUseCase registerUseCase;

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
    log('currentGoal $currentRadioGoal');
    emit(GoalChange());
  }
  void changeActivityLevel(int activityLevel,) {
    currentRadioActivityLevel = activityLevel;
    // print(currentActivityLevel);
    // currentActivityLevel = activityLevelName;
    emit(ActivityLevelChange());
  }
  Future<void> register() async {
    print(currentRadioActivityLevel);
    emit(LoadingRegisterState());
  RegisterModelRequest registerModelRequest = RegisterModelRequest(
    firstName: firstNameController.text,
    lastName:lastNameController.text ,
    email: emailController.text,
    password:passwordController.text ,
    rePassword: rePasswordController.text,
    gender:userGender,
    age: useAge,
    weight:useWeight ,
    height: useHeight,
    activityLevel: 'level$currentRadioActivityLevel',
    goal:currentGoal ,
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
