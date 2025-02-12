import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../features/auth/data/models/forget_password_models/request/forget_password_request.dart';
import '../../../features/auth/data/models/forget_password_models/request/reset_password_request.dart';
import '../../../features/auth/data/models/forget_password_models/request/verify_otp_request.dart';

import '../../../features/auth/data/models/forget_password_models/response/forget_password_response.dart';
import '../../../features/auth/data/models/forget_password_models/response/reset_password_response.dart';
import '../../../features/auth/data/models/forget_password_models/response/verify_otp_response.dart';
import '../api_constants.dart';
part 'api_manager.g.dart';

@injectable
@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {

  @FactoryMethod()
  factory ApiService(Dio dio) =_ApiService;

  @POST(ApiConstants.forgetPasswordRoute)
  Future<ForgetPasswordResponse> forgetPassword(
      @Body() ForgetPasswordRequest requestEmail);

  @POST(ApiConstants.verifyResetCode)
  Future<VerifyOtpResponse> verifyPassword(@Body() VerifyOtpRequest requestOtp);

  @PUT(ApiConstants.resetPasswordRoute)
  Future<ResetPasswordResponse> resetPassword(
      @Body() ResetPasswordRequest requestOtp);
}
