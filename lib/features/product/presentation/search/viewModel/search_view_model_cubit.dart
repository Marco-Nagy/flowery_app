import 'package:bloc/bloc.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/core/networking/error/error_handler.dart';
import 'package:flowery_e_commerce/core/networking/error/error_model.dart';
import 'package:flowery_e_commerce/features/product/domain/entities/product_response_entity.dart';
import 'package:flowery_e_commerce/features/product/domain/use_cases/search_product_use_case.dart';
import 'package:flowery_e_commerce/features/product/presentation/search/viewModel/search_action.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';


part 'search_view_model_state.dart';

@injectable
class SearchViewModelCubit extends Cubit<SearchViewModelState> {
  final SearchProductUseCase _useCase;

  @factoryMethod
  SearchViewModelCubit(this._useCase) : super(SearchViewModelInitial());

  void doAction(SearchAction action) {
    switch (action) {
      case SearchProductAction():
        _searchProducts(keyword: action.keyword);
        break;
    }
  }

  Future<void> _searchProducts({required String keyword}) async {
    emit(SearchViewModelLoading());
    final result = await _useCase.getAllProducts(searchKey: keyword);
    switch (result) {
      case Success<ProductResponseEntity>():
        emit(SearchViewModelSuccess(result.data));
        break;
      case Fail<ProductResponseEntity>():
        emit(SearchViewModelFailure(ErrorHandler.handle(result.exception!)));
        break;
    }
  }
}
