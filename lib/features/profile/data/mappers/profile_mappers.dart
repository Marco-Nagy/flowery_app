import 'package:flowery_e_commerce/features/profile/domain/entities/response/get_logged_user_data_response_entity.dart';

import '../models/response/get_logged_user_data_response_dto.dart';

class ProfileMapper {
  static GetLoggedUserDataResponseEntity toEntity(
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
}
