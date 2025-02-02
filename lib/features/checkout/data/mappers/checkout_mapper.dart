import 'package:flowery_e_commerce/features/address/domain/entities/response/SavedAddressResponseEntity.dart';
import 'package:flowery_e_commerce/features/checkout/data/models/request/shipping_address_request_dto.dart';
import 'package:flowery_e_commerce/features/checkout/data/models/response/cash_orders_response_dto.dart';
import 'package:flowery_e_commerce/features/checkout/data/models/response/checkout_orders_response_dto.dart';
import 'package:flowery_e_commerce/features/checkout/domain/entities/cash_place_order_entity.dart';
import 'package:flowery_e_commerce/features/checkout/domain/entities/credit_place_order_entity.dart';

class CheckoutMapper {
  static ShippingAddressRequestDto toOrdersRequestDto(AddressesEntity body) {
    return ShippingAddressRequestDto(ShippingAddress(
      body.street??'',
      body.phone??'0',
      body.city??'',
    ));
  }
  static CashPlaceOrderEntity toCashPlaceOrderEntity(CashOrdersResponseDto response) {
    return CashPlaceOrderEntity(
      orderId: response.order!.id??'',
      orderStatus: response.message??'',

    );
  }
  static CreditPlaceOrderEntity toCreditPlaceOrderEntity(CheckoutOrdersResponseDto response) {
    return CreditPlaceOrderEntity(
      orderId: response.session!.id??'',
      orderStatus: response.message??'',
      url: response.session!.url??'',
    );
  }
}
