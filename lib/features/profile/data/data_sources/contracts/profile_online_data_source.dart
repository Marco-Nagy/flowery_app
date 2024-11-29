import 'dart:io';

import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/get_logged_user_data_response_entity.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/upload_photo_response_entity.dart';

import '../../../domain/entities/response/edit_profile_response_entity.dart';

abstract class ProfileOnlineDataSource {
  Future<DataResult<GetLoggedUserDataResponseEntity>> getProfileData(
      String token);

  Future<DataResult<EditProfileResponseEntity>> editProfile(
      String token, Map<String, dynamic> profileData);

  Future<DataResult<UploadPhotoResponseEntity>> uploadPhoto(
      String token, File photo);
}
