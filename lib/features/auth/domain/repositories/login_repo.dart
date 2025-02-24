import '../../../../core/common/api_result.dart';

import '../../domain/entities/login_entity.dart';
import '../entities/logout_entitty.dart';

abstract class AuthRepo {
  Future<Result<LoginResponseEntity>> login(String email, String password);
  Future<Result<LogoutEntity>> logout(String token);
}
