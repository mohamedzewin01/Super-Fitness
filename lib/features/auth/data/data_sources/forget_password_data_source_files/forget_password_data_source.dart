import '../../../domain/entities/forget_password_entities/verify_otp_entity.dart';

import '../../../../../core/common/api_result.dart';
import '../../../domain/entities/forget_password_entities/forget_password_entity.dart';
import '../../../domain/entities/forget_password_entities/reset_password_entity.dart';
import '../../models/forget_password_models/request/reset_password_request.dart';

abstract interface class ForgetPasswordDataSource {
  Future<Result<ForgetPasswordEntity?>> forgetPassword(String email);
  Future<Result<VerifyOtpEntity?>> verifyPassword(String otp);
  Future<Result<ResetPasswordEntity?>> resetPassword(
      ResetPasswordRequest resetPasswordRequest);
}
