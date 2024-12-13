import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/cart/domain/entities/cart_entity.dart';
import 'package:flowery_e_commerce/features/cart/domain/entities/delete_from_cart_entity.dart';

abstract class CartRepository {
  Future<DataResult<int>> addToCart(String id);

  Future<DataResult<CartEntity>> updateCartProductQuantity(
      {required String id,required int quantity});

  Future<DataResult<CartEntity>> getUserCartData();

  Future<DataResult<RemoveFromCartEntity>> removeProductFromCart({required String id});

  Future<DataResult<String>> clearUserCartData();
}
