import '../../../../core/common/api_result.dart';
import '../../domain/entities/login_entity.dart';

import '../../domain/entities/logout_entitty.dart';
import '../models/request/login_model_dto.dart';

abstract class AuthOnlineDataSource {
  Future<Result<LoginResponseEntity>> login(LoginModelDto loginModelDto);
  Future<Result<LogoutEntity>> logout(String token);
}
