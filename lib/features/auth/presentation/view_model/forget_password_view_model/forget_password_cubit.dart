import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


import '../../../../../core/common/api_result.dart';
import '../../../domain/entities/forget_password_entities/forget_password_entity.dart';
import '../../../domain/use_cases/forget_password_use_case.dart';
import 'forget_password_state.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordState> {
  ForgetPasswordUseCase forgetPasswordUseCase;
  ForgetPasswordViewModel(this.forgetPasswordUseCase) : super(InitialState());

  final formKey = GlobalKey<FormState>();
  void doIntent(ForgetPasswordScreenIntent intent) {
    switch (intent) {
      case ForgetPasswordIntent():
        _forgetPassword(intent);
    }
  }

  void _forgetPassword(ForgetPasswordIntent intent) async {
    emit(LoadingForgetPasswordState());

    var result = await forgetPasswordUseCase.invoke(intent.email);
    switch (result) {
      case Success<ForgetPasswordEntity?>():
        emit(SuccessForgetPasswordState(result.data));
      case Fail<ForgetPasswordEntity?>():
        emit(ErrorForgetPasswordState(result.exception));
    }
  }
}

sealed class ForgetPasswordScreenIntent {}

class ForgetPasswordIntent extends ForgetPasswordScreenIntent {
  String email;

  ForgetPasswordIntent(this.email);
}
