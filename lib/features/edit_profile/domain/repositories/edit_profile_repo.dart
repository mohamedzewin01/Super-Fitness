

import 'package:super_fitness/features/edit_profile/domain/entities/edit_profile_entity.dart';

import '../../../../core/common/api_result.dart';
import '../../data/models/edit_profile_request.dart';

abstract class EditProfileRepo {

  Future<Result<EditProfileEntity?>>editProfile(EditProfileRequest editProfileRequest);

}