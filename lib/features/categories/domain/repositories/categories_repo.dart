import 'package:flowery_store/core/networking/common/api_result.dart';
import 'package:flowery_store/features/categories/domain/entities/response/get_all_categories_response_entity.dart';

abstract class CategoriesRepository {
  Future<DataResult<GetAllCategoriesResponseEntity>> getAllCategories();
}