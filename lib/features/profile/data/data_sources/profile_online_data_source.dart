import 'package:super_fitness/features/profile/domain/entities/profile_response_entity.dart';

import '../../../../core/common/api_result.dart';

abstract class ProfileOnlineDataSource{
  Future<Result<ProfileResponseEntity>> getProfileData(String token);
}