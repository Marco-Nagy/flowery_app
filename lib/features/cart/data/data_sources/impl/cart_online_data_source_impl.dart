 import 'package:flowery_e_commerce/core/networking/api/api_manager.dart';
import 'package:flowery_e_commerce/core/networking/api_execute.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/cart/data/data_sources/contracts/cart_online_data_source.dart';
import 'package:flowery_e_commerce/features/cart/data/mappers/cart_mappers.dart';
import 'package:flowery_e_commerce/features/cart/domain/entities/cart_entity.dart';
import 'package:flowery_e_commerce/features/cart/domain/entities/delete_from_cart_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartOnlineDataSource)
class CartOnlineDataSourceImpl implements CartOnlineDataSource {
  final ApiManager _apiManager;

  @factoryMethod
  CartOnlineDataSourceImpl(this._apiManager);

  @override
  Future<DataResult<int>> addToCart(String id) {
    return executeApi(() async {
      var response =
          await _apiManager.addProductToCart(CartMappers().toCrtRequestDto(id));
      return CartMappers().numOfCartItems(response);
    });
  }

  @override
  Future<DataResult<CartEntity>> getUserCartData() {
    return executeApi(() async {
      var response = await _apiManager.getCartData();
      return CartMappers().toCartEntity(response);
    });
  }

  @override
  Future<DataResult<CartEntity>> updateCartProductQuantity({
    required String id,
    required int quantity,
  }) {
    return executeApi(() async {
      var response = await _apiManager.updateCartQuantity(id,
          CartMappers().toUpdateCartRequestDto( quantity));
      return CartMappers().toCartEntity(response);
    });
  }

  @override
  Future<DataResult<RemoveFromCartEntity>> removeProductFromCart({required String id}) {
    return executeApi(() async {
      var response = await _apiManager.removeProductFromCart(id);
      return CartMappers().toRemoveFromCartEntity(response);
    });
  }

  @override
  Future<DataResult<String>> clearUserCartData() {
    return executeApi(() async {
      var response = await _apiManager.clearCartItems();
      return response;
    });
  }
}
