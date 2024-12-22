import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/address/domain/entities/response/SavedAddressResponseEntity.dart';

abstract class CheckoutRepository {
  Future<DataResult<String>> cashCheckout(AddressesEntity body);
  Future<DataResult<String>> creditCheckout(AddressesEntity body);

}
