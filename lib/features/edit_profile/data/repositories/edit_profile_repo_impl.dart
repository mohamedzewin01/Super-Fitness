
import 'package:injectable/injectable.dart';
import 'package:super_fitness/core/common/api_result.dart';
import 'package:super_fitness/features/edit_profile/data/data_sources/edit_profile_datasources.dart';
import 'package:super_fitness/features/edit_profile/domain/entities/edit_profile_entity.dart';

import '../../domain/repositories/edit_profile_repo.dart';
import '../models/edit_profile_request.dart';
@Injectable(as: EditProfileRepo)
class EditProfileRepoImpl implements EditProfileRepo{
  final EditProfileDataSource editProfileDataSource;

  EditProfileRepoImpl(this.editProfileDataSource);
  @override
  Future<Result<EditProfileEntity?>> editProfile(EditProfileRequest editProfileRequest) async{
 return await editProfileDataSource.editProfile(editProfileRequest);
  }
}