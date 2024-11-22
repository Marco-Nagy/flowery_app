import 'package:flowery_e_commerce/core/networking/error/error_model.dart';
import 'package:flowery_e_commerce/features/home_screen/domain/entities/categories_entity.dart';


abstract class CategoriesState {}

class CategoriesInitialState extends CategoriesState {}

class GetCategoriesLoadingState extends CategoriesState {}

class GetCategoriesSuccessState extends CategoriesState {
  final List<Category> categories;

  GetCategoriesSuccessState(this.categories);
}

class GetCategoriesErrorState extends CategoriesState {
  final ErrorModel errorModel;

  GetCategoriesErrorState(this.errorModel);
}
