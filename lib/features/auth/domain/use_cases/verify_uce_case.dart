
import 'package:injectable/injectable.dart';
import '../../../../core/common/api_result.dart';

import '../entities/forget_password_entities/verify_otp_entity.dart';
import '../repositories/forget_password_repo.dart';

@injectable
class VerifyUseCase {
  ForgetPasswordRepo forgetPasswordRepo;
  VerifyUseCase(this.forgetPasswordRepo);

  Future<Result<VerifyOtpEntity?>> invoke(String otp) {
    return forgetPasswordRepo.verifyPassword(otp);
  }
}
