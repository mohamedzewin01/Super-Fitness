
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../entities/logout_entitty.dart';
import '../repositories/login_repo.dart';

@injectable
class LogoutUseCases {
  AuthRepo authRepo;

  LogoutUseCases(this.authRepo);

  Future<Result<LogoutEntity>> logout(
      String token,
      ) {
    return authRepo.logout(token);
  }
}
