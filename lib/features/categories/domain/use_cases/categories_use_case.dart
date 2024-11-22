import 'package:flowery_e_commerce/features/categories/domain/repositories/categories_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';
import '../entities/response/get_all_categories_response_entity.dart';

@injectable
class CategoriesUseCase {
  final CategoriesRepository _categoriesRepository;

  @factoryMethod
  CategoriesUseCase(this._categoriesRepository);

  Future<DataResult<GetAllCategoriesResponseEntity>> getAllCategories() => _categoriesRepository.getAllCategories();
}