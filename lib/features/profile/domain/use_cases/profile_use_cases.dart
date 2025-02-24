import 'package:super_fitness/features/profile/domain/entities/profile_response_entity.dart';
import 'package:super_fitness/features/profile/domain/repositories/profile_repo.dart';


import 'package:injectable/injectable.dart';
import '../../../../core/common/api_result.dart';

@injectable
class ProfileUseCases {
  ProfileRepo profileRepo;

  ProfileUseCases(this.profileRepo);

  Future<Result<ProfileResponseEntity>> getProfileData(
      String token,
      ) {
    return profileRepo.getProfileData(token);
  }
}
