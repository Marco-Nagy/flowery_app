import 'package:flowery_e_commerce/core/networking/common/api_result.dart';

import 'package:flowery_e_commerce/features/categories/domain/entities/response/get_all_categories_response_entity.dart';

import '../../domain/repositories/categories_repo.dart';

class CategoriesRepositoryImplementation implements CategoriesRepository {
  @override
  Future<DataResult<GetAllCategoriesResponseEntity>> getAllCategories() {
    // TODO: implement getAllCategories
    throw UnimplementedError();
  }

}