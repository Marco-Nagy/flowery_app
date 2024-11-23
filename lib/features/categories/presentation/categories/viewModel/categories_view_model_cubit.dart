import 'package:bloc/bloc.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/categories/domain/use_cases/categories_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/networking/error/error_handler.dart';
import '../../../../../core/networking/error/error_model.dart';
import '../../../domain/entities/response/get_all_categories_response_entity.dart';
import 'categories_action.dart';

part 'categories_view_model_state.dart';

@injectable
class CategoriesViewModelCubit extends Cubit<CategoriesViewModelState> {
  final CategoriesUseCase _categoriesUseCase;

  @factoryMethod
  CategoriesViewModelCubit(this._categoriesUseCase)
      : super(CategoriesViewModelInitial());

  void doAction(CategoriesScreenAction action) {
    switch (action) {
      case GetCategoriesAction():
        _getAllCategories();
    }
  }

  Future<void> _getAllCategories() async {
    emit(GetCategoriesViewModelLoading());
    final result = await _categoriesUseCase.getAllCategories();
    switch (result) {
      case Success<GetAllCategoriesResponseEntity>():
        emit(GetCategoriesViewModelSuccess(
            categories: result.data.categories ?? []));
      case Fail<GetAllCategoriesResponseEntity>():
        emit(GetCategoriesViewModelError(
            error: ErrorHandler.handle(result.exception!)));
    }
  }
}
