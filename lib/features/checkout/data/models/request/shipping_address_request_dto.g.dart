// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_address_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingAddressRequestDto _$ShippingAddressRequestDtoFromJson(
        Map<String, dynamic> json) =>
    ShippingAddressRequestDto(
      json['shippingAddress'] == null
          ? null
          : ShippingAddress.fromJson(
              json['shippingAddress'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShippingAddressRequestDtoToJson(
        ShippingAddressRequestDto instance) =>
    <String, dynamic>{
      'shippingAddress': instance.shippingAddress,
    };

ShippingAddress _$ShippingAddressFromJson(Map<String, dynamic> json) =>
    ShippingAddress(
      json['street'] as String?,
      json['phone'] as String?,
      json['city'] as String?,
    );

Map<String, dynamic> _$ShippingAddressToJson(ShippingAddress instance) =>
    <String, dynamic>{
      'street': instance.street,
      'phone': instance.phone,
      'city': instance.city,
    };
