import 'dart:io';

import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/get_logged_user_data_response_entity.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/upload_photo_response_entity.dart';

import '../../../domain/entities/request/change_password_request_entity.dart';
import '../../../domain/entities/response/change_password_respose_entity.dart';
import '../../../domain/entities/response/edit_profile_response_entity.dart';

abstract class ProfileOnlineDataSource {
  Future<DataResult<GetLoggedUserDataResponseEntity>> getProfileData();

  Future<DataResult<EditProfileResponseEntity>> editProfile(
      Map<String, dynamic> profileData);

  Future<DataResult<UploadPhotoResponseEntity>> uploadPhoto(File photo);

  Future<DataResult<ChangePasswordResponseEntity>> changePassword(
      ChangePasswordRequestEntity request);
}
