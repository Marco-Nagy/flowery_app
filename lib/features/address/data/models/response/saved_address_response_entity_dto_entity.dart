import 'package:json_annotation/json_annotation.dart';

part 'saved_address_response_entity_dto_entity.g.dart';

@JsonSerializable()
class SavedAddressResponseEntityDtoEntity {
  String? message;
  List<SavedAddressResponseEntityDtoAddressesEntity?>? addresses;

  SavedAddressResponseEntityDtoEntity(this.message, this.addresses);

  factory SavedAddressResponseEntityDtoEntity.fromJson(
          Map<String, dynamic> json) =>
      _$SavedAddressResponseEntityDtoEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SavedAddressResponseEntityDtoEntityToJson(this);
}

@JsonSerializable()
class SavedAddressResponseEntityDtoAddressesEntity {
  String? street;
  String? phone;
  String? city;
  @JsonKey(name: '_id')
  String? id;

  SavedAddressResponseEntityDtoAddressesEntity(
      this.street, this.phone, this.city, this.id);

  factory SavedAddressResponseEntityDtoAddressesEntity.fromJson(
          Map<String, dynamic> json) =>
      _$SavedAddressResponseEntityDtoAddressesEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SavedAddressResponseEntityDtoAddressesEntityToJson(this);
}
