import 'package:injectable/injectable.dart';
import 'package:super_fitness/core/common/api_result.dart';
import 'package:super_fitness/features/profile/data/data_sources/profile_online_data_source.dart';
import 'package:super_fitness/features/profile/domain/entities/profile_response_entity.dart';
import 'package:super_fitness/features/profile/domain/repositories/profile_repo.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl extends ProfileRepo {
  ProfileOnlineDataSource profileOnlineDataSource;

  ProfileRepoImpl(this.profileOnlineDataSource);

  @override
  Future<Result<ProfileResponseEntity>> getProfileData(String token) {
    return profileOnlineDataSource.getProfileData(token);
  }
}
