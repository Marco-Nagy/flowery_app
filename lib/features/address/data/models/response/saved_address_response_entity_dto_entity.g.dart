// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_address_response_entity_dto_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedAddressResponseEntityDtoEntity
    _$SavedAddressResponseEntityDtoEntityFromJson(Map<String, dynamic> json) =>
        SavedAddressResponseEntityDtoEntity(
          json['message'] as String?,
          (json['addresses'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : SavedAddressResponseEntityDtoAddressesEntity.fromJson(
                      e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$SavedAddressResponseEntityDtoEntityToJson(
        SavedAddressResponseEntityDtoEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'addresses': instance.addresses,
    };

SavedAddressResponseEntityDtoAddressesEntity
    _$SavedAddressResponseEntityDtoAddressesEntityFromJson(
            Map<String, dynamic> json) =>
        SavedAddressResponseEntityDtoAddressesEntity(
          json['street'] as String?,
          json['phone'] as String?,
          json['city'] as String?,
          json['_id'] as String?,
        );

Map<String, dynamic> _$SavedAddressResponseEntityDtoAddressesEntityToJson(
        SavedAddressResponseEntityDtoAddressesEntity instance) =>
    <String, dynamic>{
      'street': instance.street,
      'phone': instance.phone,
      'city': instance.city,
      '_id': instance.id,
    };
