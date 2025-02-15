import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:super_fitness/features/auth/data/models/register_models/register_request.dart';
import 'package:super_fitness/features/auth/data/models/register_models/register_response.dart';

import '../../../features/auth/data/models/request/login_model_dto.dart';
import '../../../features/auth/data/models/response/login_response_dto.dart';
import '../api_constants.dart';
part 'api_manager.g.dart';

@injectable
@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {

  @FactoryMethod()
  factory ApiService(Dio dio) =_ApiService;

  @POST(ApiConstants.loginRoute)
  Future<LoginResponseDto> login(@Body() LoginModelDto loginModelDto);
// @POST(ApiConstants.signupRoute)
  // Future<RegisterResponseDto> signUp(@Body() RegisterModelDto registerModelDto);
  @POST(ApiConstants.register)
  Future<RegisterModelResponse> register(@Body() RegisterModelRequest registerModelDto);
}
