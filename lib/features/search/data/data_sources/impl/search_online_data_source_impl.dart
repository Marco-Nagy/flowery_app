import 'package:flowery_e_commerce/core/networking/api/api_manager.dart';
import 'package:flowery_e_commerce/core/networking/api_execute.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/search/domain/entities/response/search_response_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../mapper/search_mapper.dart';
import '../contracts/online_data_source/search_online_data_source.dart';

@Injectable(as: SearchOnlineDataSource)
class SearchOnlineDataSourceImpl implements SearchOnlineDataSource {
  final ApiManager _apiManager;

  @factory
  SearchOnlineDataSourceImpl(this._apiManager);

  @override
  Future<DataResult<SearchResponseEntity>> searchProducts(
      {required String keyword}) {
    return executeApi(() async {
      var response = await _apiManager.searchProducts(keyword);
      return SearchMapper.toSearchResponseEntity(response);
    });
  }
}
