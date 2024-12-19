import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/search/domain/entities/response/search_response_entity.dart';

abstract class SearchOnlineDataSource {
  Future<DataResult<SearchResponseEntity>> searchProducts(
      {required String keyword});
}
