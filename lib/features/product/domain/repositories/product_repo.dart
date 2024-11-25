import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/product/domain/entities/product_response_entity.dart';

abstract class ProductRepo {
  Future<DataResult<ProductResponseEntity>> getAllProducts();
}
