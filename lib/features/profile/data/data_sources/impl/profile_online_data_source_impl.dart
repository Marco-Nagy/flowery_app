import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flowery_e_commerce/core/networking/api/api_manager.dart';
import 'package:flowery_e_commerce/core/networking/api_execute.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/profile/data/mappers/profile_mappers.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/edit_profile_response_entity.dart';

import 'package:flowery_e_commerce/features/profile/domain/entities/response/get_logged_user_data_response_entity.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/upload_photo_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../contracts/profile_online_data_source.dart';

@Injectable(as: ProfileOnlineDataSource)
class ProfileOnlineDataSourceImpl implements ProfileOnlineDataSource {
  final ApiManager _apiManager;

  @factoryMethod
  ProfileOnlineDataSourceImpl(this._apiManager);

  @override
  Future<DataResult<GetLoggedUserDataResponseEntity>> getProfileData() {
    return executeApi(() async {
      var response = await _apiManager.getLoggedUserData();
      return ProfileMapper.getLoggedResponseToEntity(response);
      var response = await _apiManager.getLoggedUserData("Bearer$token");
      return ProfileMapper.toEntity(response);
    });
  }

  @override
  Future<DataResult<EditProfileResponseEntity>> editProfile(
      Map<String, dynamic> profileData) {
    return executeApi(() async {
      var response = await _apiManager.editProfile(profileData);
      return ProfileMapper.editProfileResponseToEntity(response);
    });
  }

  @override
  Future<DataResult<UploadPhotoResponseEntity>> uploadPhoto(File photo) {
    return executeApi(() async {
      var response = await _apiManager.uploadPhoto(photo);
      return ProfileMapper.uploadPhotoResponseToEntity(response);
    });
  }
}
