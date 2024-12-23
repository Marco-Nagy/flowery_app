import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/address/domain/entities/response/SavedAddressResponseEntity.dart';
import 'package:flowery_e_commerce/features/checkout/domain/repositories/contracts/checkout_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreditUseCase {
  final CheckoutRepository repository;
  CreditUseCase(this.repository);
  
  Future<DataResult<String>> call(AddressesEntity body) async {
    return await repository.creditCheckout(body);
  }


}
