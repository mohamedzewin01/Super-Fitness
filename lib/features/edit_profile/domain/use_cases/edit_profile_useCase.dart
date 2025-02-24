import 'package:injectable/injectable.dart';
import 'package:super_fitness/features/edit_profile/domain/repositories/edit_profile_repo.dart';

import '../../../../core/common/api_result.dart';
import '../../data/models/edit_profile_request.dart';
import '../entities/edit_profile_entity.dart';

@injectable
class EditProfileUseCase {
  final EditProfileRepo editProfileRepo;

  EditProfileUseCase(this.editProfileRepo);

  Future<Result<EditProfileEntity?>> editProfile(
      EditProfileRequest editProfileRequest) async {
    return await editProfileRepo.editProfile(editProfileRequest);
  }
}
