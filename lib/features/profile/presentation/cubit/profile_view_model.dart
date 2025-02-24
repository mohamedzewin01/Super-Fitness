import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:super_fitness/features/profile/domain/entities/profile_response_entity.dart';
import 'package:super_fitness/features/profile/domain/use_cases/profile_use_cases.dart';
import 'package:super_fitness/features/profile/presentation/cubit/profile_states.dart';

import '../../../../../core/common/api_result.dart';

@injectable
class ProfileViewModel extends Cubit<ProfileStates> {
  final ProfileUseCases profileUseCases;

  ProfileViewModel(this.profileUseCases) : super(InitialState());

  Future<void> getProfileData(String token) async {
    emit(LoadingProfileState());

    var result = await profileUseCases.getProfileData(token);
    print("===========================================");
    print("loaddddding statessssssssssssssss");
    switch (result) {
      case Success<ProfileResponseEntity>():
        print("===========================================");
        print("succcccccesssssssssssssssssssssssss statessssssssssssssss");
        print("===========================================");
        print(result.data.message);
        emit(SuccessProfileState(result.data));
      case Fail<ProfileResponseEntity>():
        print("errrrorrrrrrrrrrrrrrrrrrrrrr statessssssssssssssss");
        print("===========================================");
        emit(ErrorProfileState(result.exception));
    }
  }
}
