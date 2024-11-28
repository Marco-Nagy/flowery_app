// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordResponseDto _$ChangePasswordResponseDtoFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordResponseDto(
      json['message'] as String?,
      json['token'] as String?,
    );

Map<String, dynamic> _$ChangePasswordResponseDtoToJson(
        ChangePasswordResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
    };
