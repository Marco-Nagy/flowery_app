import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/generic/data/mappers/mapper.dart';
import 'package:flowery_e_commerce/features/generic/domain/entity/generic_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/networking/api/api_manager.dart';
import '../../../../../core/networking/api_execute.dart';
import '../contracts/generic_online_data_source.dart';

@Injectable(as: GenericOnlineDataSource)
class GenericOnlineDataSourceImpl implements GenericOnlineDataSource {
  final ApiManager _apiManager;

  @factoryMethod
  GenericOnlineDataSourceImpl(this._apiManager);

  @override
  Future<DataResult<GenericResponseEntity>> getAll(String resourceName) {
    return executeApi(() async {
      var response = await _apiManager.getGenericProduct(resourceName);
      return Mapper.toEntity(response, resourceName);
    });
  }
}

