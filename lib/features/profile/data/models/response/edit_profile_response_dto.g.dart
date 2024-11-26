// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfileResponseDto _$EditProfileResponseDtoFromJson(
        Map<String, dynamic> json) =>
    EditProfileResponseDto(
      json['message'] as String?,
      json['user'] == null
          ? null
          : EditProfileResponseDtoUser.fromJson(
              json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EditProfileResponseDtoToJson(
        EditProfileResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
    };

EditProfileResponseDtoUser _$EditProfileResponseDtoUserFromJson(
        Map<String, dynamic> json) =>
    EditProfileResponseDtoUser(
      json['_id'] as String?,
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['email'] as String?,
      json['password'] as String?,
      json['gender'] as String?,
      json['phone'] as String?,
      json['photo'] as String?,
      json['role'] as String?,
      json['createdAt'] as String?,
    );

Map<String, dynamic> _$EditProfileResponseDtoUserToJson(
        EditProfileResponseDtoUser instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'gender': instance.gender,
      'phone': instance.phone,
      'photo': instance.photo,
      'role': instance.role,
      'createdAt': instance.createdAt,
    };
