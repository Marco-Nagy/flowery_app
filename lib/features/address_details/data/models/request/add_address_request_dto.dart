import 'package:json_annotation/json_annotation.dart';

part 'add_address_request_dto.g.dart';

@JsonSerializable()
class AddAddressRequestDto {
  final String? street;
  final String? phone;
  final String? city;

  AddAddressRequestDto(this.street, this.phone, this.city);

  factory AddAddressRequestDto.fromJson(Map<String, dynamic> json) =>
      _$AddAddressRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AddAddressRequestDtoToJson(this);
}
