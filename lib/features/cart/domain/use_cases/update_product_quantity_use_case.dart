import 'package:flowery_store/core/networking/common/api_result.dart';
import 'package:flowery_store/features/cart/domain/entities/cart_entity.dart';
import 'package:flowery_store/features/cart/domain/repositories/contracts/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateProductQuantityUseCase {
  final CartRepository _repository;
  UpdateProductQuantityUseCase(this._repository);
  Future<DataResult<CartEntity>> call( {required String id,required int quantity}){
    return _repository.updateCartProductQuantity(id: id, quantity: quantity);

  }
}
