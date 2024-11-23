import 'package:bloc/bloc.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/features/categories/domain/entities/response/get_all_products_response_entity.dart';
import 'package:flowery_e_commerce/features/categories/domain/use_cases/products_use_case.dart';
import 'package:flowery_e_commerce/features/categories/presentation/products/viewModel/get_products_actions.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/networking/error/error_handler.dart';
import '../../../../../core/networking/error/error_model.dart';

part 'products_view_model_state.dart';

@injectable
class ProductsViewModelCubit extends Cubit<ProductsViewModelState> {
  final ProductsUseCase _useCase;

  @factoryMethod
  ProductsViewModelCubit(this._useCase) : super(ProductsViewModelInitial());

  void doAction(GetProductsScreenAction action) {
    switch (action) {
      case GetProductsAction():
        _getProducts();
    }
  }

  Future<void> _getProducts() async {
    emit(GetProductsViewModelLoading());
    final result = await _useCase.getAllProducts();
    switch (result) {
      case Success<GetAllProductsRsponseEntity>():
        emit(GetProductsViewModelSuccess(data: result.data));
      case Fail<GetAllProductsRsponseEntity>():
        emit(GetProductsViewModelError(
            error: ErrorHandler.handle(result.exception!)));
    }
  }
}
