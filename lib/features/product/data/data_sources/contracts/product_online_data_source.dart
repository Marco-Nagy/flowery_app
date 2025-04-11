import 'package:flowery_store/core/networking/common/api_result.dart';
import '../../../domain/entities/product_response_entity.dart';

abstract class ProductOnlineDataSource {
  Future<DataResult<ProductResponseEntity>> getAllProducts({String? keyword});
}
