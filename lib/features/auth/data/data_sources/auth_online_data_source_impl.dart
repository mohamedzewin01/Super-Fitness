import 'package:injectable/injectable.dart';
import '../../../../core/common/api_result.dart';
import '../../domain/entities/logout_entitty.dart';
import 'auth_online_data_source.dart';
import '../models/request/login_model_dto.dart';
import '../../domain/entities/login_entity.dart';

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
  @override
  Future<Result<LogoutEntity>> logout(String token) {
    return executeApi(() async {
      var response = await _authRetrofit.logout(token);
      return response.toLogoutEntity();
    });
  }
}
