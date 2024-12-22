import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/address/domain/entities/response/SavedAddressResponseEntity.dart';

abstract class CheckoutOnlineDataSource {
  Future<DataResult<String>> cashCheckout(AddressesEntity entity);
  Future<DataResult<String>> creditCheckout(AddressesEntity entity);
}
