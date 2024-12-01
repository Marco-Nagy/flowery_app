import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/cart/domain/repositories/contracts/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ClearUserCartDataUseCase {
  final CartRepository _repository;

  ClearUserCartDataUseCase(this._repository);

  Future<DataResult<String>> call() {
    return _repository.clearUserCartData();
  }
}
