part of 'edit_profile_cubit.dart';

@immutable
sealed class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}
final class WeightChange extends EditProfileState {}
final class GoalChange extends EditProfileState {}
final class ActivityLevelChange extends EditProfileState {}
final class ImageChange extends EditProfileState {}
final class SuccessEditProfileState extends EditProfileState {
  final EditProfileEntity? editProfileEntity;

  SuccessEditProfileState(this.editProfileEntity);
}
final class ErrorEditProfileState extends EditProfileState {
 final Exception exception;
  ErrorEditProfileState(this.exception);
}


