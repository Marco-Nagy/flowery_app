import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/categories/data/data_sources/contracts/products_online_data_source.dart';
import 'package:flowery_e_commerce/features/categories/domain/entities/response/get_all_products_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/products_repo.dart';

@Injectable(as: ProductsRepo)
class ProductsRepoImpl implements ProductsRepo {
  final ProductsOnlineDataSource _onlineDataSource;

  @factoryMethod
  ProductsRepoImpl(this._onlineDataSource);

  @override
  Future<DataResult<GetAllProductsRsponseEntity>> getAllProducts() async {
    return await _onlineDataSource.getAllProducts();
  }
}
