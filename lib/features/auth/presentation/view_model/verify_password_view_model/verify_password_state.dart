import '../../../domain/entities/forget_password_entities/verify_otp_entity.dart';


sealed class VerifyPasswordState {}

class InitialState extends VerifyPasswordState {}

class SuccessVerifyPasswordState extends VerifyPasswordState {
  VerifyOtpEntity? verifyPasswordEntity;

  SuccessVerifyPasswordState(this.verifyPasswordEntity);
}

class LoadingVerifyPasswordState extends VerifyPasswordState {}

class ErrorVerifyPasswordState extends VerifyPasswordState {
  Exception? exception;

  ErrorVerifyPasswordState(this.exception);
}
