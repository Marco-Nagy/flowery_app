import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/generic_product/data/data_sources/contracts/generic_products_online_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/response/generic_product_response_entity.dart';
import '../../domain/repositories/generic_products_repo.dart';

@Injectable(as: GenericProductsRepo)
class GenericProductsRepoImpl implements GenericProductsRepo {
  final GenericProductsOnlineDataSource _onlineDataSource;

  @factoryMethod
  GenericProductsRepoImpl(this._onlineDataSource);

  @override
  Future<DataResult<GenericProductResponseEntity>> getAllProducts() async {
    return await _onlineDataSource.getAllProducts();
  }
}
