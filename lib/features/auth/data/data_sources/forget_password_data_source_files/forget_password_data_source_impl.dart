import 'package:injectable/injectable.dart';
import '../../models/forget_password_models/request/verify_otp_request.dart';
import '../../../domain/entities/forget_password_entities/verify_otp_entity.dart';

import '../../../../../core/api/api_extentions.dart';
import '../../../../../core/api/api_manager/api_manager.dart';
import '../../../../../core/common/api_result.dart';
import '../../../domain/entities/forget_password_entities/forget_password_entity.dart';
import '../../../domain/entities/forget_password_entities/reset_password_entity.dart';

import '../../models/forget_password_models/request/forget_password_request.dart';
import '../../models/forget_password_models/request/reset_password_request.dart';
import 'forget_password_data_source.dart';

@Injectable(as: ForgetPasswordDataSource)
class ForgetPasswordDataSourceImpl implements ForgetPasswordDataSource {
  final ApiService _authRetrofit;

  ForgetPasswordDataSourceImpl(this._authRetrofit);

  @override
  Future<Result<ForgetPasswordEntity?>> forgetPassword(String email) {
    ForgetPasswordRequest requestEmail = ForgetPasswordRequest(email: email);
    return executeApi(() async {
      var response = await _authRetrofit.forgetPassword(requestEmail);
      return response.toForgetPasswordEntity();
    });
  }

  @override
  Future<Result<VerifyOtpEntity?>> verifyPassword(String otp) {
    VerifyOtpRequest requestOtp = VerifyOtpRequest(resetCode: otp);
    return executeApi(() async {
      var response = await _authRetrofit.verifyPassword(requestOtp);
      return response.toVerifyOtpEntity();
    });
  }

  @override
  Future<Result<ResetPasswordEntity?>> resetPassword(
      ResetPasswordRequest resetPasswordRequest) {
    return executeApi(() async {
      var response = await _authRetrofit.resetPassword(resetPasswordRequest);
      return response.toResetPasswordEntity();
    });
  }
}
