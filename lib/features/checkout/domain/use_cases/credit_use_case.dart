import 'package:flowery_store/core/networking/common/api_result.dart';
import 'package:flowery_store/features/address/domain/entities/response/SavedAddressResponseEntity.dart';
import 'package:flowery_store/features/checkout/domain/entities/credit_place_order_entity.dart';
import 'package:flowery_store/features/checkout/domain/repositories/contracts/checkout_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreditUseCase {
  final CheckoutRepository _repository;
  CreditUseCase(this._repository);
  
  Future<DataResult<CreditPlaceOrderEntity>> call(AddressesEntity body) async {
    return await _repository.creditCheckout(body);
  }


}
