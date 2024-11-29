import 'dart:io';

import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
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
  Future<DataResult<GetLoggedUserDataResponseEntity>> getProfileData(
      String token) async {
    return await _onlineDataSource.getProfileData(token);
  }

  @override
  Future<DataResult<EditProfileResponseEntity>> editProfile(
      String token, Map<String, dynamic> profileData) async {
    return await _onlineDataSource.editProfile(token, profileData);
  }

  @override
  Future<DataResult<UploadPhotoResponseEntity>> uploadPhoto(
      String token, File photo) async {
    return await _onlineDataSource.uploadPhoto(token, photo);
  }
}
