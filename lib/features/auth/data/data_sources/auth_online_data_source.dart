import 'package:super_fitness/core/common/api_result.dart';
import 'package:super_fitness/features/auth/domain/entities/login_entity.dart';

import '../models/request/login_model_dto.dart';

abstract class AuthOnlineDataSource {
  Future<Result<LoginResponseEntity>> login(LoginModelDto loginModelDto);
}
