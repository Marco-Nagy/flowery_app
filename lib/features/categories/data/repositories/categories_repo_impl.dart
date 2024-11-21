import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/categories/data/data_sources/contracts/categories_online_data_source.dart';

import 'package:flowery_e_commerce/features/categories/domain/entities/response/get_all_categories_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/categories_repo.dart';

@Injectable(as: CategoriesRepository)
class CategoriesRepositoryImplementation implements CategoriesRepository {

  final CategoriesOnlineDataSource _onlineDataSource;

  @factoryMethod
  CategoriesRepositoryImplementation(this._onlineDataSource);

  @override
  Future<DataResult<GetAllCategoriesResponseEntity>> getAllCategories() async{
    return await _onlineDataSource.getAllCategories();
  }

}