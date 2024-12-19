import 'package:flowery_e_commerce/features/search/domain/entities/response/search_response_entity.dart';

abstract class SearchOnlineDataSource {
  Future<SearchResponseEntityProducts> searchProducts(
      {required String keyword});
}
