import 'package:json_annotation/json_annotation.dart';

part 'add_address_request_dto.g.dart';

@JsonSerializable()
class AddAddressRequestDto {
  final String? street;
  final String? phone;
  final String? city;
  final String? lat;
  final String? long;
  final String? username;

  AddAddressRequestDto(
      this.street, this.phone, this.city, this.lat, this.long, this.username);

  factory AddAddressRequestDto.fromJson(Map<String, dynamic> json) =>
      _$AddAddressRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AddAddressRequestDtoToJson(this);
}
