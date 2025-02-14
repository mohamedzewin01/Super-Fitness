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