import 'package:flowery_e_commerce/features/address/domain/entities/response/SavedAddressResponseEntity.dart';

sealed class CheckoutBaseAction {
}
class SelectAddressAction extends CheckoutBaseAction {
  final AddressesEntity address;
  final int index;
   SelectAddressAction(this.address, this.index);
}
class SelectPaymentOptionAction extends CheckoutBaseAction {
  final String option;
  SelectPaymentOptionAction(this.option);
}
class CheckoutAction extends CheckoutBaseAction {
  CheckoutAction();
}
