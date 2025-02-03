import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/address/domain/entities/response/SavedAddressResponseEntity.dart';
import 'package:flowery_e_commerce/features/checkout/data/data_sources/contracts/checkout_online_data_source.dart';
import 'package:flowery_e_commerce/features/checkout/domain/entities/cash_place_order_entity.dart';
import 'package:flowery_e_commerce/features/checkout/domain/entities/credit_place_order_entity.dart';
import 'package:flowery_e_commerce/features/checkout/domain/repositories/contracts/checkout_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:CheckoutRepository )
class CheckoutRepositoryImpl extends CheckoutRepository{
  final CheckoutOnlineDataSource _dataSource;
  CheckoutRepositoryImpl({required CheckoutOnlineDataSource dataSource}) : _dataSource = dataSource {
  }
  @override
  Future<DataResult<CashPlaceOrderEntity>> cashCheckout(AddressesEntity entity) {
   final result = _dataSource.cashCheckout(entity);
    return result;
  }

  @override
  Future<DataResult<CreditPlaceOrderEntity>> creditCheckout(AddressesEntity entity) {
    final result = _dataSource.creditCheckout(entity);
    return result;
  }
}
