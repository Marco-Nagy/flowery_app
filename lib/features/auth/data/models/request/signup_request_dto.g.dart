// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequestDto _$SignUpRequestDtoFromJson(Map<String, dynamic> json) =>
    SignUpRequestDto(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      rePassword: json['rePassword'] as String?,
      phone: json['phone'] as String?,
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$SignUpRequestDtoToJson(SignUpRequestDto instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'rePassword': instance.rePassword,
      'phone': instance.phone,
      'gender': instance.gender,
    };
