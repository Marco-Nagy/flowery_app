import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/cart/domain/repositories/contracts/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartUseCase {
  final CartRepository _repository;
  AddToCartUseCase(this._repository);

  Future<DataResult<int>> call({required String productId}) async {
    return await _repository.addToCart(productId);
  }
}
