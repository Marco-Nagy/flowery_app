
import 'package:flowery_store/features/address/domain/entities/request/add_address_request_entity.dart';

sealed class AddressAction {}

class AddAddressSubmitAction extends AddressAction {
  final AddAddressRequestEntity request;

  AddAddressSubmitAction(this.request);
}

class FetchCountriesAction extends AddressAction {}

class FetchCitiesAction extends AddressAction {
  final String countryCode;

  FetchCitiesAction(this.countryCode);
}
class FetchSavedAddressesAction extends AddressAction {}
class UpdateAddressAction extends AddressAction {
  final String addressId;
  final AddAddressRequestEntity body;

  UpdateAddressAction(this.addressId, this.body);
}
class DeleteAddressAction extends AddressAction {
  final String addressId;

  DeleteAddressAction(this.addressId, );
}