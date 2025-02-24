import 'dart:io';
import 'package:dio/dio.dart' hide DioMediaType;
import '../utils/cashed_data_shared_preferences.dart';
import 'package:http_parser/http_parser.dart';
import 'api_constants.dart';
 import 'dio_provider.dart';
import 'model/upLoad_image_response.dart';

class UploadImageApiManger {
  String token = CacheService.getData(key: CacheConstants.userToken);

  Future<UpLoadImageResponse> uploadImage(
      {required File imageFile}) async {
    FormData data = FormData();
    data.files.add(
      MapEntry(
        'photo',
        await MultipartFile.fromFile(imageFile.path,
            contentType: MediaType("image", imageFile.path.split(".").last),
            filename: imageFile.path.split('.').first),
      ),
    );
    var headers = {
      'token': token,
      'Authorization': "Bearer $token",
    };
    Dio dio = dioProvider();
    var response = await dio.put('${ApiConstants.baseUrl}${ApiConstants.uploadPhoto}',
        data: data,
        options: Options(
          method: 'PUT',
          headers: headers,
        ));
    return UpLoadImageResponse.fromJson(response.data);
  }
}


