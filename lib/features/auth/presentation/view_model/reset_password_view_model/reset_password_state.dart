
import '../../../domain/entities/forget_password_entities/reset_password_entity.dart';

sealed class ResetPasswordState {}

class InitialState extends ResetPasswordState {}

class SuccessResetPasswordState extends ResetPasswordState {
  ResetPasswordEntity? resetPasswordEntity;

  SuccessResetPasswordState(this.resetPasswordEntity);
}

class LoadingResetPasswordState extends ResetPasswordState {}

class ErrorResetPasswordState extends ResetPasswordState {
  Exception? exception;

  ErrorResetPasswordState(this.exception);
}
