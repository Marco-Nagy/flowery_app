import '../../../../core/networking/common/api_result.dart';
import '../entities/response/search_response_entity.dart';

abstract class SearchRepo {
  Future<DataResult<SearchResponseEntity>> searchProducts(
      {required String keyword});
}
