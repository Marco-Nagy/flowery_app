import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/address/domain/entities/response/SavedAddressResponseEntity.dart';
import 'package:flowery_e_commerce/features/checkout/domain/entities/cash_place_order_entity.dart';
import 'package:flowery_e_commerce/features/checkout/domain/repositories/contracts/checkout_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CashUseCase {
  final CheckoutRepository repository;
  CashUseCase(this.repository);
  Future<DataResult<CashPlaceOrderEntity>> call(AddressesEntity body){
    return repository.cashCheckout(body); // replace with actual API call

  }
}
