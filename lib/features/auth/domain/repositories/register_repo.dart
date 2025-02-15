import '../../../../core/common/api_result.dart';
import '../entities/register_entities.dart';

import '../../data/models/register_models/register_request.dart';

abstract class RegisterRepo {
  Future<Result<RegisterEntity?>> register(
      RegisterModelRequest registerModelRequest);
}
