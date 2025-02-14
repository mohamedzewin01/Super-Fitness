import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:super_fitness/features/auth/data/models/register_models/register_request.dart';
import 'package:super_fitness/features/auth/data/models/register_models/register_response.dart';

import '../api_constants.dart';
part 'api_manager.g.dart';

@injectable
@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {

  @FactoryMethod()
  factory ApiService(Dio dio) =_ApiService;

  @POST(ApiConstants.register)
  Future<RegisterModelResponse> register(@Body() RegisterModelRequest registerModelDto);


}
