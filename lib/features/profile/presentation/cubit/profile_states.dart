
import 'package:super_fitness/features/profile/domain/entities/profile_response_entity.dart';

sealed class ProfileStates {}

class InitialState extends ProfileStates {}

class SuccessProfileState extends ProfileStates {
  ProfileResponseEntity profileResponseEntity;

  SuccessProfileState(this.profileResponseEntity);
}

class LoadingProfileState extends ProfileStates {}

class ErrorProfileState extends ProfileStates {
  Exception? exception;

  ErrorProfileState(this.exception);
}
