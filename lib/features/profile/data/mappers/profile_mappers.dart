import 'package:flowery_e_commerce/features/profile/data/models/response/edit_profile_response_dto.dart';
import 'package:flowery_e_commerce/features/profile/data/models/response/upload_photo_response_dto.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/edit_profile_response_entity.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/get_logged_user_data_response_entity.dart';
import 'package:flowery_e_commerce/features/profile/domain/entities/response/upload_photo_response_entity.dart';

import '../models/response/get_logged_user_data_response_dto.dart';

class ProfileMapper {
  static GetLoggedUserDataResponseEntity getLoggedResponseToEntity(
      GetLoggedUserDataResponseDto dto) {
    return GetLoggedUserDataResponseEntity(
      user: toUserEntity(dto.user!),
    );
  }

  static GetLoggedUserDataResponseUserEntity toUserEntity(
      GetLoggedUserDataResponseDtoUser dto) {
    return GetLoggedUserDataResponseUserEntity(
        id: dto.id,
        email: dto.email,
        firstName: dto.firstName,
        lastName: dto.lastName,
        phone: dto.phone,
        photo: dto.photo,
        role: dto.role,
        gender: dto.gender);
  }

  static EditProfileResponseEntity editProfileResponseToEntity(
      EditProfileResponseDto dto) {
    return EditProfileResponseEntity(
      user: editProfileToUserEntity(dto.user!),
    );
  }

  static EditProfileResponseUserEntity editProfileToUserEntity(
      EditProfileResponseDtoUser dto) {
    return EditProfileResponseUserEntity(
        id: dto.id,
        email: dto.email,
        firstName: dto.firstName,
        lastName: dto.lastName,
        phone: dto.phone,
        photo: dto.photo,
        role: dto.role,
        gender: dto.gender);
  }

  static UploadPhotoResponseEntity uploadPhotoResponseToEntity(
      UploadPhotoResponseDto dto) {
    return UploadPhotoResponseEntity(dto.message);
  }
}
