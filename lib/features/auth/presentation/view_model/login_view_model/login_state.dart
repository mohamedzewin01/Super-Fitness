import 'package:super_fitness/features/auth/domain/entities/login_entity.dart';


sealed class LoginState {}

class InitialState extends LoginState {}

class SuccessLoginState extends LoginState {
  LoginResponseEntity loginResponseEntity;

  SuccessLoginState(this.loginResponseEntity);
}

class LoadingLoginState extends LoginState {}

class ErrorLoginState extends LoginState {
  Exception? exception;

  ErrorLoginState(this.exception);
}
