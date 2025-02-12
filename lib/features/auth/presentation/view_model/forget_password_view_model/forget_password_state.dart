

import '../../../domain/entities/forget_password_entities/forget_password_entity.dart';

sealed class ForgetPasswordState {}

class InitialState extends ForgetPasswordState {}

class SuccessForgetPasswordState extends ForgetPasswordState {
  ForgetPasswordEntity? forgetPasswordEntity;

  SuccessForgetPasswordState(this.forgetPasswordEntity);
}

class LoadingForgetPasswordState extends ForgetPasswordState {}

class ErrorForgetPasswordState extends ForgetPasswordState {
  Exception? exception;

  ErrorForgetPasswordState(this.exception);
}
