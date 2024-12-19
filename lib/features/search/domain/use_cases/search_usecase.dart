import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';
import '../contracts/search_repo.dart';
import '../entities/response/search_response_entity.dart';

@injectable
class SearchUseCase {
  final SearchRepo repo;

  @factoryMethod
  SearchUseCase({required this.repo});

  Future<DataResult<SearchResponseEntity>> searchProducts(
          {required String keyword}) =>
      repo.searchProducts(keyword: keyword);
}
