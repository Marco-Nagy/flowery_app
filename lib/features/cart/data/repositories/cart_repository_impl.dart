import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/cart/data/data_sources/contracts/cart_online_data_source.dart';
import 'package:flowery_e_commerce/features/cart/domain/entities/cart_entity.dart';
import 'package:flowery_e_commerce/features/cart/domain/repositories/contracts/cart_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final CartOnlineDataSource _dataSource;

  CartRepositoryImpl(this._dataSource);

  @override
  Future<DataResult<int>> addToCart(String id) async {
    var result = await _dataSource.addToCart(id);
    return result;
  }

  @override
  Future<DataResult<String>> clearUserCartData() async {
    var result = await _dataSource.clearUserCartData();
    return result;
  }

  @override
  Future<DataResult<CartEntity>> getUserCartData() async {
    var result = await _dataSource.getUserCartData();
    return result;
  }

  @override
  Future<DataResult<CartEntity>> removeProductFromCart(
      {required String id}) async {
    var result = await _dataSource.removeProductFromCart(id: id);
    return result;
  }

  @override
  Future<DataResult<CartEntity>> updateCartProductQuantity({
    required String id,
    required int quantity,
  }) async {
    var result = await _dataSource.updateCartProductQuantity(
      id: id,
      quantity: quantity,
    );
    return result;
  }
}
