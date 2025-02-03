import 'package:flowery_e_commerce/core/networking/api/api_constants.dart';
import 'package:flowery_e_commerce/core/networking/api/api_manager.dart';
import 'package:flowery_e_commerce/core/networking/api_execute.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/address/domain/entities/response/SavedAddressResponseEntity.dart';
import 'package:flowery_e_commerce/features/checkout/data/data_sources/contracts/checkout_online_data_source.dart';
import 'package:flowery_e_commerce/features/checkout/data/mappers/checkout_mapper.dart';
import 'package:flowery_e_commerce/features/checkout/domain/entities/cash_place_order_entity.dart';
import 'package:flowery_e_commerce/features/checkout/domain/entities/credit_place_order_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CheckoutOnlineDataSource)
class CheckoutOnlineDataSourceImpl implements CheckoutOnlineDataSource {
  final ApiManager _apiManager;

  @factoryMethod
  CheckoutOnlineDataSourceImpl(this._apiManager);

  @override
  Future<DataResult<CashPlaceOrderEntity>> cashCheckout(AddressesEntity entity) {
    return executeApi(() async {
      var response = await _apiManager.cashOrders(
        CheckoutMapper.toOrdersRequestDto(entity),
      );
      return CheckoutMapper.toCashPlaceOrderEntity( response);
    });
  }

  @override
  Future<DataResult<CreditPlaceOrderEntity>> creditCheckout(AddressesEntity entity) {
    return executeApi(() async {
      var response = await _apiManager.checkoutOrders(
        ApiConstants.checkOutUrl,CheckoutMapper.toOrdersRequestDto(entity),
      );
      return CheckoutMapper.toCreditPlaceOrderEntity(response);
    });
  }
}
