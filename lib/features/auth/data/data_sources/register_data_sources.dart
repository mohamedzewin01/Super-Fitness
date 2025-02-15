import 'package:injectable/injectable.dart';
import 'package:super_fitness/core/api/api_extentions.dart';
import 'package:super_fitness/core/api/api_manager/api_manager.dart';
import 'package:super_fitness/core/common/api_result.dart';
import 'package:super_fitness/features/auth/data/data_sources/register_data_sources_repo.dart';
import 'package:super_fitness/features/auth/domain/entities/register_entities.dart';

import '../models/register_models/register_request.dart';


@Injectable(as: RegisterDataSourcesRepo)
class RegisterDataSources implements RegisterDataSourcesRepo {
  final ApiService apiService;

  RegisterDataSources( this.apiService);

@override
  Future<Result<RegisterEntity?>> register(RegisterModelRequest request) {
    return executeApi(() async {
      var response = await apiService.register(request);
      return response.toRegisterEntities();
    });
  }
}





