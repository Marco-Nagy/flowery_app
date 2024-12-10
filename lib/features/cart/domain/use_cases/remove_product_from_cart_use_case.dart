import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/cart/domain/entities/delete_from_cart_entity.dart';
import 'package:flowery_e_commerce/features/cart/domain/repositories/contracts/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveProductFromCartUseCase {
  final CartRepository _repository;
  RemoveProductFromCartUseCase(this._repository);
  Future<DataResult<RemoveFromCartEntity>> call({required String id}){
    return _repository.removeProductFromCart( id: id);

  }
}
