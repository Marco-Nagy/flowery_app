import 'dart:io';

import 'package:flowery_e_commerce/features/profile/domain/entities/request/change_password_request_entity.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/change_password_response_entity.dart';
import 'package:flowery_e_commerce/features/profile/domain/repositories/profile_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';
import '../entities/response/edit_profile_response_entity.dart';
import '../entities/response/get_logged_user_data_response_entity.dart';
import '../entities/response/upload_photo_response_entity.dart';

@injectable
class ProfileUseCase {
  final ProfileRepo _repository;

  @factoryMethod
  ProfileUseCase(this._repository);

  Future<DataResult<GetLoggedUserDataResponseEntity>> getProfileData() =>
      _repository.getProfileData();

  Future<DataResult<EditProfileResponseEntity>> editProfile(
          Map<String, dynamic> profileData) =>
      _repository.editProfile(profileData);

  Future<DataResult<UploadPhotoResponseEntity>> uploadPhoto(File photo) =>
      _repository.uploadPhoto(photo);
  Future<DataResult<ChangePasswordResponseEntity>> changePassword(ChangePasswordRequestEntity request) =>
      _repository.changePassword( request);
}
