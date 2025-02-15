import 'package:injectable/injectable.dart';
import 'package:super_fitness/core/common/api_result.dart';
import 'package:super_fitness/features/auth/data/data_sources/auth_online_data_source.dart';
import 'package:super_fitness/features/auth/data/models/request/login_model_dto.dart';
import 'package:super_fitness/features/auth/domain/entities/login_entity.dart';

import '../../../../core/api/api_extentions.dart';
import '../../../../core/api/api_manager/api_manager.dart';

@Injectable(as: AuthOnlineDataSource)
class AuthOnlineDataSourceImpl extends AuthOnlineDataSource {
  final ApiService _authRetrofit;

  AuthOnlineDataSourceImpl(this._authRetrofit);

  @override
  Future<Result<LoginResponseEntity>> login(LoginModelDto loginModelDto) {
    return executeApi(() async {
      var response = await _authRetrofit.login(loginModelDto);
      return response.toLoginResponseEntity();
    });
  }
}
