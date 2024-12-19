import 'package:flowery_e_commerce/features/address/domain/entities/response/SavedAddressResponseEntity.dart';
import 'package:flowery_e_commerce/features/checkout/data/models/request/shipping_address_request_dto.dart';

class CheckoutMapper {
  static ShippingAddressRequestDto toOrdersRequestDto(AddressesEntity body) {
    return ShippingAddressRequestDto(ShippingAddress(
      body.street??'',
      body.phone??'0',
      body.city??'',
    ));
  }
}
