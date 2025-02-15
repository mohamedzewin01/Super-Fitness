import 'package:injectable/injectable.dart';
import '../../../../core/common/api_result.dart';
import '../data_sources/register_data_sources_repo.dart';

import '../models/register_models/register_request.dart';

import '../../domain/entities/register_entities.dart';

import '../../domain/repositories/register_repo.dart';

@Injectable(as: RegisterRepo)
class RegisterRepoImp implements RegisterRepo {
  RegisterDataSourcesRepo registerDataSources;
  RegisterRepoImp(this.registerDataSources);
  @override
  Future<Result<RegisterEntity?>> register(
      RegisterModelRequest registerModelRequest) {
    return registerDataSources
        .register(registerModelRequest); //registerDataSources
  }
}
