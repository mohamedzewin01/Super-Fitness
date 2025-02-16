import 'package:injectable/injectable.dart';
import 'package:super_fitness/features/auth/domain/repositories/forget_password_repo.dart';

import '../../../../core/common/api_result.dart';
import '../entities/forget_password_entities/forget_password_entity.dart';


@injectable
class ForgetPasswordUseCase {
  ForgetPasswordRepo forgetPasswordRepo;
  ForgetPasswordUseCase(this.forgetPasswordRepo);

  Future<Result<ForgetPasswordEntity?>> invoke(String email) {
    return forgetPasswordRepo.forgetPassword(email);
  }
}
