// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordRequestDto _$ChangePasswordRequestDtoFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordRequestDto(
      json['password'] as String?,
      json['newPassword'] as String?,
    );

Map<String, dynamic> _$ChangePasswordRequestDtoToJson(
        ChangePasswordRequestDto instance) =>
    <String, dynamic>{
      'password': instance.password,
      'newPassword': instance.newPassword,
    };
