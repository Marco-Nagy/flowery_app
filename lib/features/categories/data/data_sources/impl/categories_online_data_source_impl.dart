import 'package:flowery_e_commerce/core/networking/api_execute.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/categories/data/mappers/categories_mappers.dart';

import 'package:flowery_e_commerce/features/categories/domain/entities/response/get_all_categories_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/networking/api/api_manager.dart';
import '../contracts/categories_online_data_source.dart';

@Injectable(as: CategoriesOnlineDataSource)
class CategoriesOnlineDataSourceImplementation implements CategoriesOnlineDataSource {
  final ApiManager _apiManager;

  @factoryMethod
  CategoriesOnlineDataSourceImplementation(this._apiManager);
  @override
  Future<DataResult<GetAllCategoriesResponseEntity>> getAllCategories()  {
    return  executeApi(() async {
      final response = await _apiManager.getAllCategories();
      return CategoriesMapper.toEntity(response);
    });
  }

}