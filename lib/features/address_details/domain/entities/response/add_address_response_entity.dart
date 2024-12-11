class AddAddressResponseEntity {
  final List<AddAddressResponseEntityAddress?>? address;

  AddAddressResponseEntity({this.address});
}

class AddAddressResponseEntityAddress {
  final String? street;
  final String? phone;
  final String? city;
  final String? id;

  AddAddressResponseEntityAddress(
      {this.street, this.phone, this.city, this.id});
}
