import 'package:super_fitness/core/common/api_result.dart';

import '../../domain/entities/login_entity.dart';

abstract class AuthRepo {
  Future<Result<LoginResponseEntity>> login(String email, String password);
}
