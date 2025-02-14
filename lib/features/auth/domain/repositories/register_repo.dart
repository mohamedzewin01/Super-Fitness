import 'package:super_fitness/core/common/api_result.dart';
import 'package:super_fitness/features/auth/domain/entities/register_entities.dart';

import '../../data/models/register_models/register_request.dart';

abstract class RegisterRepo {
  Future<Result<RegisterEntity?>> register(
      RegisterModelRequest registerModelRequest);
}
