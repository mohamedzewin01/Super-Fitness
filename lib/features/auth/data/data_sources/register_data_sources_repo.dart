import '../../../../core/common/api_result.dart';
import '../../domain/entities/register_entities.dart';
import '../models/register_models/register_request.dart';

abstract class RegisterDataSourcesRepo {

  Future<Result<RegisterEntity?>> register(RegisterModelRequest request);
}