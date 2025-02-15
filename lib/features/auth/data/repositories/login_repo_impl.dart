import 'package:injectable/injectable.dart';
import 'package:super_fitness/core/common/api_result.dart';
import 'package:super_fitness/features/auth/data/data_sources/auth_online_data_source.dart';
import 'package:super_fitness/features/auth/data/models/request/login_model_dto.dart';
import 'package:super_fitness/features/auth/domain/entities/login_entity.dart';

import '../../domain/repositories/login_repo.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  AuthOnlineDataSource authOnlineDataSource;

  AuthRepoImpl(this.authOnlineDataSource);

  @override
  Future<Result<LoginResponseEntity>> login(String email, String password) {
    return authOnlineDataSource
        .login(LoginModelDto(email: email, password: password));
  }
}
