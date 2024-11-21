import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/categories/domain/entities/response/get_all_categories_response_entity.dart';

abstract class CategoriesOnlineDataSource {
  Future<DataResult<GetAllCategoriesResponseEntity>> getAllCategories();
}