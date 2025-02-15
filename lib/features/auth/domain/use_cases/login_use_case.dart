import '../entities/login_entity.dart';

import 'package:injectable/injectable.dart';
import '../../../../core/common/api_result.dart';
import '../repositories/login_repo.dart';

@injectable
class LoginUseCases {
  AuthRepo authRepo;

  LoginUseCases(this.authRepo);

  Future<Result<LoginResponseEntity>> login(
    String email,
    String password,
  ) {
    return authRepo.login(email, password);
  }
}
