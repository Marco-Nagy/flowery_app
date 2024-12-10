class AddAddressResponseDto {
  final List<AddAddressResponseDtoAddress?>? address;

  AddAddressResponseDto({this.address});
}

class AddAddressResponseDtoAddress {
  final String? street;
  final String? phone;
  final String? city;
  final String? id;

  AddAddressResponseDtoAddress({this.street, this.phone, this.city, this.id});
}
