import 'package:injectable/injectable.dart';
import '../../../../core/common/api_result.dart';
import '../data_sources/auth_online_data_source.dart';
import '../models/request/login_model_dto.dart';
import '../../domain/entities/login_entity.dart';

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
