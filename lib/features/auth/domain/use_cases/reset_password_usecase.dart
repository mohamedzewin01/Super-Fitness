import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../entities/forget_password_entities/reset_password_entity.dart';
import '../repositories/forget_password_repo.dart';


@injectable
class ResetPasswordUseCase {
  ForgetPasswordRepo forgetPasswordRepo;

  ResetPasswordUseCase(this.forgetPasswordRepo);

  Future<Result<ResetPasswordEntity?>> invoke(
      String email, String newPassword) {
    return forgetPasswordRepo.resetPassword(email, newPassword);
  }
}
