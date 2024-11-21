import '../../domain/entities/response/get_all_categories_response_entity.dart';
import '../models/response/get_all_categories_response_dto.dart';

class CategoriesMapper {
  static GetAllCategoriesResponseEntity toEntity(GetAllCategoriesResponseDto response) {
    return GetAllCategoriesResponseEntity(
      categories: response.categories?.map((e) => toCategoriesEntity(e)).toList(),
    );
  }

  static GetAllCategoriesResponseCategoriesEntity toCategoriesEntity(GetAllCategoriesResponseDtoCategories? category) {
    return GetAllCategoriesResponseCategoriesEntity(
      id: category?.id,
      name: category?.name,
      slug: category?.slug,
      image: category?.image,
      createdAt: category?.createdAt,
      updatedAt: category?.updatedAt,
    );
  }


}