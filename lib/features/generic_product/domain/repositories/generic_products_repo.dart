import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/generic_product/domain/entities/response/generic_product_response_entity.dart';

abstract class GenericProductsRepo {
  Future<DataResult<GenericProductResponseEntity>> getAllProducts();
}
