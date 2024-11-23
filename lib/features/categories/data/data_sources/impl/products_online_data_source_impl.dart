import 'package:flowery_e_commerce/core/networking/api/api_manager.dart';
import 'package:flowery_e_commerce/core/networking/api_execute.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/categories/data/mappers/products_mappers.dart';

import 'package:flowery_e_commerce/features/categories/domain/entities/response/get_all_products_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../contracts/products_online_data_source.dart';

@Injectable(as: ProductsOnlineDataSource)
class ProductsOnlineDataSourceImpl implements ProductsOnlineDataSource {
  final ApiManager _apiManager;

  @factoryMethod
  ProductsOnlineDataSourceImpl(this._apiManager);

  @override
  Future<DataResult<GetAllProductsRsponseEntity>> getAllProducts() {
    return executeApi(() async {
      final response = await _apiManager.getAllProducts();
      return ProductsMapper.toEntity(response);
    });
  }
}
