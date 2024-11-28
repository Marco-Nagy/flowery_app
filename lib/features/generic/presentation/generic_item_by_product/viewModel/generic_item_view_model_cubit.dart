import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:bloc/bloc.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/networking/error/error_handler.dart';
import '../../../../../core/networking/error/error_model.dart';
import '../../../../generic/domain/entity/generic_response_entity.dart';
import '../../../../generic/domain/use_cases/generic_use_case.dart';

import '../../../../product/domain/entities/product_response_entity.dart';
import '../../../../product/domain/use_cases/product_use_case.dart';
import 'generic_item_action.dart';

part 'generic_item_view_model_state.dart';

@injectable
class GenericItemViewModelCubit extends Cubit<GenericItemViewModeState> {
  final GenericUseCase _itemsUseCase;
  final ProductUseCase _productsUseCase;
  List<ProductEntity> allProducts = [];
  List<Items> items = [];
  String itemField = 'category';
  bool isFetching = false;


  @factoryMethod
  GenericItemViewModelCubit(this._itemsUseCase, this._productsUseCase)
      : super(GetItemsInitial());

  void doAction(GenericItemAction action) {
    switch (action) {
      case GetItemAction():
        _getAllItems(action.resourceName);
      case GetProductAction():
        _getProducts();
      case FilterProductsAction():
        _filterProducts(action.selectedIndex, action.field);
    }
  }

  Future<void> _getAllItems(String resourceName) async {
    emit(GetItemsLoading());
    final result = await _itemsUseCase.getAllItems(resourceName);

    switch (result) {
      case Success<GenericResponseEntity>():
        items = result.data.items ?? [];
        print("Items fetched successfully: ${items.length} items");
        emit(GetItemsSuccess(items: items));
        break;

      case Fail<GenericResponseEntity>():
        final error = ErrorHandler.handle(result.exception!);
        print("Failed to fetch items: $error");
        emit(GetItemsError(error: error));
        break;
    }
  }

  Future<void> _getProducts() async {
    emit(GetProductLoading());
    final result = await _productsUseCase.getAllProducts();

    switch (result) {
      case Success<ProductResponseEntity>():
        allProducts = result.data.products;
        print("Products fetched successfully: ${allProducts.length} products");
        emit(GetProductSuccess(products: allProducts));
        break;

      case Fail<ProductResponseEntity>():
        final error = ErrorHandler.handle(result.exception!);
        print("Failed to fetch products: $error");
        emit(GetProductError(error: error));
        break;
    }
  }

  void _filterProducts(int selectedIndex, String field) {
    itemField = field;

    final filtered = selectedIndex == 0
        ? allProducts
        : allProducts
            .where((product) =>
                (field == 'category' ? product.category : product.occasion) ==
                items[selectedIndex - 1].id)
            .toList();

    emit(FilteredProductsState(filteredProducts: filtered));
  }

}
