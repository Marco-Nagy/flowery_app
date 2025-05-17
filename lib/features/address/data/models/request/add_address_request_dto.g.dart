// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_address_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAddressRequestDto _$AddAddressRequestDtoFromJson(
        Map<String, dynamic> json) =>
    AddAddressRequestDto(
      json['street'] as String?,
      json['phone'] as String?,
      json['city'] as String?,
      json['lat'] as String?,
      json['long'] as String?,
      json['username'] as String?,
    );

Map<String, dynamic> _$AddAddressRequestDtoToJson(
        AddAddressRequestDto instance) =>
    <String, dynamic>{
      'street': instance.street,
      'phone': instance.phone,
      'city': instance.city,
      'lat': instance.lat,
      'long': instance.long,
      'username': instance.username,
    };
