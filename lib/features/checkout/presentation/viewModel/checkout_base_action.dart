import 'package:flowery_e_commerce/features/address_details/domain/entities/request/add_address_request_entity.dart';

sealed class CheckoutBaseAction {
}
class SelectAddressAction extends CheckoutBaseAction {
  final AddAddressRequestEntity address;
   SelectAddressAction(this.address);
}
