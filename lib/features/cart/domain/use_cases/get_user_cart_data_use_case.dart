import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/cart/domain/entities/cart_entity.dart';
import 'package:flowery_e_commerce/features/cart/domain/repositories/contracts/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserCartDataUseCase {
  final CartRepository _repository;

  GetUserCartDataUseCase(this._repository);
  Future<DataResult<CartEntity>> call(){
    return _repository.getUserCartData();
  }

}
