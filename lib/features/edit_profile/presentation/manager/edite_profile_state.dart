part of 'edit_profile_cubit.dart';

@immutable
sealed class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}
final class AgeChange extends EditProfileState {}
final class WeightChange extends EditProfileState {}
final class HeightChange extends EditProfileState {}
final class GoalChange extends EditProfileState {}
final class ActivityLevelChange extends EditProfileState {}



sealed class EditProfileScreenIntent {}

class EditProfileIntent extends EditProfileScreenIntent {}

class ChangeAgeIntent extends EditProfileScreenIntent {
  final int age;
  ChangeAgeIntent(this.age);
}

class ChangeWeightIntent extends EditProfileScreenIntent {
  final int weight;
  ChangeWeightIntent(this.weight);
}

class ChangeHeightIntent extends EditProfileScreenIntent {
  final int height;
  ChangeHeightIntent(this.height);
}

class ChangeGoalIntent extends EditProfileScreenIntent {
  final int goal;
  final String goalName;
  ChangeGoalIntent(this.goal, this.goalName);
}

class ChangeActivityLevelIntent extends EditProfileScreenIntent {
  final int activityLevel;
  ChangeActivityLevelIntent(this.activityLevel);
}