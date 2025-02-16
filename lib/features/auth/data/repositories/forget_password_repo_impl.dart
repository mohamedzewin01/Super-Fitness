
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../../domain/entities/forget_password_entities/forget_password_entity.dart';
import '../../domain/entities/forget_password_entities/reset_password_entity.dart';
import '../../domain/entities/forget_password_entities/verify_otp_entity.dart';
import '../../domain/repositories/forget_password_repo.dart';
import '../data_sources/forget_password_data_source_files/forget_password_data_source.dart';
import '../models/forget_password_models/request/reset_password_request.dart';

@Injectable(as: ForgetPasswordRepo)
class ForgetPasswordRepoImpl implements ForgetPasswordRepo{
  ForgetPasswordDataSource onLineDataSource;

  ForgetPasswordRepoImpl(
      this.onLineDataSource,
      );


  @override
  Future<Result<ForgetPasswordEntity?>> forgetPassword(String email) {
    return onLineDataSource.forgetPassword(email);
  }

  @override
  Future<Result<VerifyOtpEntity?>> verifyPassword(String otp) {
    return onLineDataSource.verifyPassword(otp);
  }

  @override
  Future<Result<ResetPasswordEntity?>> resetPassword(
      String email, String newPassword) {
    return onLineDataSource.resetPassword(
        ResetPasswordRequest(email: email, newPassword: newPassword));
  }

}
