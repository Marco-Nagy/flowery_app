import 'package:flowery_e_commerce/core/networking/common/api_result.dart';

import 'package:flowery_e_commerce/features/search/domain/entities/response/search_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/contracts/search_repo.dart';
import '../data_sources/contracts/online_data_source/search_online_data_source.dart';

@Injectable(as: SearchRepo)
class SearchRepoImpl implements SearchRepo {
  final SearchOnlineDataSource _onlineDataSource;

  @factoryMethod
  SearchRepoImpl(this._onlineDataSource);

  @override
  Future<DataResult<SearchResponseEntity>> searchProducts(
      {required String keyword}) async {
    return await _onlineDataSource.searchProducts(keyword: keyword);
  }
}
