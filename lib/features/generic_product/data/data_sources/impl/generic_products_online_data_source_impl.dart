import 'package:flowery_e_commerce/core/networking/api/api_manager.dart';
import 'package:flowery_e_commerce/core/networking/api_execute.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/entities/response/generic_product_response_entity.dart';
import '../../mappers/generic_products_mappers.dart';
import '../contracts/generic_products_online_data_source.dart';

@Injectable(as: GenericProductsOnlineDataSource)
class GenericProductsOnlineDataSourceImpl implements GenericProductsOnlineDataSource {
  final ApiManager _apiManager;

  @factoryMethod
  GenericProductsOnlineDataSourceImpl(this._apiManager);

  @override
  Future<DataResult<GenericProductResponseEntity>> getAllProducts() {
    return executeApi(() async {
      final response = await _apiManager.getProduct();
      return GenericProductsMapper.toEntity(response);
    });
  }
}
