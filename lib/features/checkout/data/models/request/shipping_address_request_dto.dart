import 'package:json_annotation/json_annotation.dart';

part 'shipping_address_request_dto.g.dart';

@JsonSerializable()
class ShippingAddressRequestDto {
  final ShippingAddress? shippingAddress;

  ShippingAddressRequestDto(this.shippingAddress);


  Map<String, dynamic> toJson() => _$ShippingAddressRequestDtoToJson(this);
}

@JsonSerializable()
class ShippingAddress {
  final String? street;
  final String? phone;
  final String? city;

  ShippingAddress(this.street, this.phone, this.city);


  Map<String, dynamic> toJson() =>
      _$ShippingAddressToJson(this);
}
