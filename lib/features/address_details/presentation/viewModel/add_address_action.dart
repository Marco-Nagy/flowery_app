import 'package:flowery_e_commerce/features/address_details/domain/entities/request/add_address_request_entity.dart';

sealed class AddAddressAction {}

class AddAddressSubmitAction extends AddAddressAction {
  final AddAddressRequestEntity request;

  AddAddressSubmitAction(this.request);
}
