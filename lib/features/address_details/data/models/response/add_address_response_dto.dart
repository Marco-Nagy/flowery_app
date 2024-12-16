import 'package:json_annotation/json_annotation.dart';

part 'add_address_response_dto.g.dart';

@JsonSerializable()
class AddAddressResponseDto {
  final String? message;
  final List<AddAddressResponseDtoAddress?>? address;

  AddAddressResponseDto(this.message, this.address);

  factory AddAddressResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AddAddressResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AddAddressResponseDtoToJson(this);
}

@JsonSerializable()
class AddAddressResponseDtoAddress {
  final String? street;
  final String? phone;
  final String? city;
  @JsonKey(name: '_id')
  final String? id;

  AddAddressResponseDtoAddress(this.street, this.phone, this.city, this.id);

  factory AddAddressResponseDtoAddress.fromJson(Map<String, dynamic> json) =>
      _$AddAddressResponseDtoAddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddAddressResponseDtoAddressToJson(this);
}
