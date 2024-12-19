import 'package:bloc/bloc.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/core/networking/error/error_model.dart';
import 'package:flowery_e_commerce/features/search/domain/use_cases/search_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/networking/error/error_handler.dart';
import '../../domain/entities/response/search_response_entity.dart';

part 'search_view_model_state.dart';

@injectable
class SearchViewModelCubit extends Cubit<SearchViewModelState> {
  final SearchUseCase _useCase;

  @factoryMethod
  SearchViewModelCubit(this._useCase) : super(SearchViewModelInitial());

  Future<void> searchProducts({required String keyword}) async {
    emit(SearchViewModelLoading());
    final result = await _useCase.searchProducts(keyword: keyword);
    switch (result) {
      case Success<SearchResponseEntity>():
        emit(SearchViewModelSuccess(result.data));
        break;
      case Fail<SearchResponseEntity>():
        emit(SearchViewModelFailure(ErrorHandler.handle(result.exception!)));
        break;
    }
  }
}
