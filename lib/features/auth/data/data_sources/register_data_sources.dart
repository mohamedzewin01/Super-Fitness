import 'package:injectable/injectable.dart';
import '../../../../core/api/api_extentions.dart';
import '../../../../core/api/api_manager/api_manager.dart';
import '../../../../core/common/api_result.dart';
import 'register_data_sources_repo.dart';
import '../../domain/entities/register_entities.dart';

import '../models/register_models/register_request.dart';

@Injectable(as: RegisterDataSourcesRepo)
class RegisterDataSources implements RegisterDataSourcesRepo {
  final ApiService apiService;

  RegisterDataSources(this.apiService);

  @override
  Future<Result<RegisterEntity?>> register(RegisterModelRequest request) {
    return executeApi(() async {
      var response = await apiService.register(request);
      return response.toRegisterEntities();
    });
  }
}
