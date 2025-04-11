import 'package:flowery_store/core/networking/common/api_result.dart';
import 'package:flowery_store/features/cart/domain/entities/cart_entity.dart';

abstract class CartRepository {
  Future<DataResult<int>> addToCart(String id);

  Future<DataResult<CartEntity>> updateCartProductQuantity(
      {required String id,required int quantity});

  Future<DataResult<CartEntity>> getUserCartData();

  Future<DataResult<CartEntity>> removeProductFromCart({required String id});

  Future<DataResult<String>> clearUserCartData();
}
