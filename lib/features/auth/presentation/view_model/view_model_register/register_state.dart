part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class ViewModelInitial extends RegisterState {}
final class IndicatorChanged extends RegisterState {}
final class GenderChanged extends RegisterState {}
final class AgeChange extends RegisterState {}
final class WeightChange extends RegisterState {}
final class HeightChange extends RegisterState {}
final class GoalChange extends RegisterState {}
final class ActivityLevelChange extends RegisterState {}
class SuccessRegisterState extends RegisterState {
  final RegisterEntity registerEntity;
  SuccessRegisterState(this.registerEntity);
}
class LoadingRegisterState extends RegisterState {}
class ErrorRegisterState extends RegisterState {
  final Exception? exception;

  ErrorRegisterState(this.exception);
}
class IsPasswordChanged extends RegisterState {}
class IsRePasswordChanged extends RegisterState {}
class ShowBack extends RegisterState {}