import 'package:injectable/injectable.dart';
import 'package:super_fitness/core/common/api_result.dart';
import 'package:super_fitness/features/profile/data/data_sources/profile_online_data_source.dart';
import 'package:super_fitness/features/profile/domain/entities/profile_response_entity.dart';

import '../../../../core/api/api_extentions.dart';
import '../../../../core/api/api_manager/api_manager.dart';

@Injectable(as: ProfileOnlineDataSource)
class ProfileOnlineDataSourceImpl extends ProfileOnlineDataSource {
  final ApiService _profileRetrofit;

  ProfileOnlineDataSourceImpl(this._profileRetrofit);

  @override
  Future<Result<ProfileResponseEntity>> getProfileData(String token) {
    return executeApi(() async {
      var response = await _profileRetrofit.getProfileData(token);
      return response.toProfileResponseEntity();
    });
  }
}
