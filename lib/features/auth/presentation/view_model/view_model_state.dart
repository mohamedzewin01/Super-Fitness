part of 'view_model_cubit.dart';

@immutable
sealed class ViewModelState {}

final class ViewModelInitial extends ViewModelState {}
final class IndicatorChanged extends ViewModelState {}
final class GenderChanged extends ViewModelState {}