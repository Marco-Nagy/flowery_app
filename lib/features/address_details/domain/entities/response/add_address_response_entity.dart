import 'package:equatable/equatable.dart';

class AddAddressResponseEntity extends Equatable {
  final List<AddAddressResponseEntityAddress?>? address;

  AddAddressResponseEntity({this.address});

  @override
  List<Object?> get props => [address];
}

class AddAddressResponseEntityAddress extends Equatable {
  final String? street;
  final String? phone;
  final String? city;
  final String? id;

  AddAddressResponseEntityAddress(
      {this.street, this.phone, this.city, this.id});

  @override
  List<Object?> get props => [street, phone, city, id];
}
