import 'dart:io';

import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/request/change_password_request_entity.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/change_password_response_entity.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/edit_profile_response_entity.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/get_logged_user_data_response_entity.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/upload_photo_response_entity.dart';
import 'package:flowery_e_commerce/features/profile/domain/repositories/profile_repo.dart';
import 'package:injectable/injectable.dart';

import '../data_sources/contracts/profile_online_data_source.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileOnlineDataSource _onlineDataSource;

  @factoryMethod
  ProfileRepoImpl(this._onlineDataSource);

  @override
  Future<DataResult<GetLoggedUserDataResponseEntity>> getProfileData() async {
    return await _onlineDataSource.getProfileData();
  }

  @override
  Future<DataResult<EditProfileResponseEntity>> editProfile(
      Map<String, dynamic> profileData) async {
    return await _onlineDataSource.editProfile(profileData);
  }

  @override
  Future<DataResult<UploadPhotoResponseEntity>> uploadPhoto(File photo) async {
    return await _onlineDataSource.uploadPhoto(photo);
  }

  @override
  Future<DataResult<ChangePasswordResponseEntity>> changePassword(ChangePasswordRequestEntity request) async {

    return await _onlineDataSource.changePassword(request);
  }
}
