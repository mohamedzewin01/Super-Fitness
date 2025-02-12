
import '../../../../core/common/api_result.dart';
import '../entities/forget_password_entities/forget_password_entity.dart';
import '../entities/forget_password_entities/reset_password_entity.dart';
import '../entities/forget_password_entities/verify_otp_entity.dart';

abstract class ForgetPasswordRepo {

  Future<Result<ForgetPasswordEntity?>> forgetPassword(String email);
  Future<Result<VerifyOtpEntity?>> verifyPassword(String otp);
  Future<Result<ResetPasswordEntity?>> resetPassword(
      String email, String newPassword);

}
