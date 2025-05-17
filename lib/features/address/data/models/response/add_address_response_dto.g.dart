// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_address_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAddressResponseDto _$AddAddressResponseDtoFromJson(
        Map<String, dynamic> json) =>
    AddAddressResponseDto(
      json['message'] as String?,
      (json['address'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : AddAddressResponseDtoAddress.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddAddressResponseDtoToJson(
        AddAddressResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'address': instance.address,
    };

AddAddressResponseDtoAddress _$AddAddressResponseDtoAddressFromJson(
        Map<String, dynamic> json) =>
    AddAddressResponseDtoAddress(
      json['street'] as String?,
      json['phone'] as String?,
      json['city'] as String?,
      json['_id'] as String?,
    );

Map<String, dynamic> _$AddAddressResponseDtoAddressToJson(
        AddAddressResponseDtoAddress instance) =>
    <String, dynamic>{
      'street': instance.street,
      'phone': instance.phone,
      'city': instance.city,
      '_id': instance.id,
    };
