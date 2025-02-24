import 'package:super_fitness/core/common/api_result.dart';
import 'package:super_fitness/features/profile/domain/entities/profile_response_entity.dart';

abstract class ProfileRepo {
  Future<Result<ProfileResponseEntity>> getProfileData(String token);
}
