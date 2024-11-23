import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/categories/domain/entities/response/get_all_products_response_entity.dart';

abstract class ProductsOnlineDataSource {
  Future<DataResult<GetAllProductsRsponseEntity>> getAllProducts();
}
