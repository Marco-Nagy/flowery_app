import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/product/data/data_sources/contracts/product_online_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/product_response_entity.dart';
import '../../domain/repositories/product_repo.dart';

@Injectable(as:ProductRepo)
class ProductRepoImpl implements ProductRepo {
  final ProductOnlineDataSource _onlineDataSource;

  @factoryMethod
  ProductRepoImpl(this._onlineDataSource);

  @override
  Future<DataResult<ProductResponseEntity>> getAllProducts() async {
    return await _onlineDataSource.getAllProducts();
  }
}
