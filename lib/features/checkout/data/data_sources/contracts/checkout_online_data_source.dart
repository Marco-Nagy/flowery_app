import 'package:flowery_store/core/networking/common/api_result.dart';
import 'package:flowery_store/features/address/domain/entities/response/SavedAddressResponseEntity.dart';
import 'package:flowery_store/features/checkout/domain/entities/cash_place_order_entity.dart';
import 'package:flowery_store/features/checkout/domain/entities/credit_place_order_entity.dart';

abstract class CheckoutOnlineDataSource {
  Future<DataResult<CashPlaceOrderEntity>> cashCheckout(AddressesEntity entity);
  Future<DataResult<CreditPlaceOrderEntity>> creditCheckout(AddressesEntity entity);
}
