import 'package:flowery_store/core/networking/common/api_result.dart';
import 'package:flowery_store/features/categories/domain/entities/response/get_all_products_response_entity.dart';

abstract class ProductsRepo {
  Future<DataResult<GetAllProductsRsponseEntity>> getAllProducts();
}
