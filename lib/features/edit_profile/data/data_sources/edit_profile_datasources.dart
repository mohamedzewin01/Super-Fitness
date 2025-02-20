
import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:super_fitness/core/api/api_manager/api_manager.dart';
import 'package:super_fitness/core/common/api_result.dart';
import 'package:super_fitness/features/edit_profile/domain/entities/edit_profile_entity.dart';

import '../../../../core/api/api_extentions.dart';
import '../../../../core/utils/cashed_data_shared_preferences.dart';
import '../models/edit_profile_request.dart';

@injectable
class EditProfileDataSource {
  ApiService apiService;

  EditProfileDataSource(this.apiService);


  Future<Result<EditProfileEntity?>>editProfile(EditProfileRequest editProfileRequest) {
    return executeApi(() async {
      String token =
      CacheService.getData(key: CacheConstants.userToken);
      var response = await apiService.editProfile("Bearer $token",editProfileRequest);
      var data = response.toEditProfileEntities();
      log(data.message??'14/////////////////////');
      return data;
    });
  }


}