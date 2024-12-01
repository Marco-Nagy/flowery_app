import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/core/networking/error/error_handler.dart';
import 'package:flowery_e_commerce/core/networking/error/error_model.dart';
import 'package:flowery_e_commerce/features/cart/domain/entities/cart_entity.dart';
import 'package:flowery_e_commerce/features/cart/domain/use_cases/add_to_cart_use_case.dart';
import 'package:flowery_e_commerce/features/cart/domain/use_cases/clear_user_cart_data_use_case.dart';
import 'package:flowery_e_commerce/features/cart/domain/use_cases/get_user_cart_data_use_case.dart';
import 'package:flowery_e_commerce/features/cart/domain/use_cases/remove_product_from_cart_use_case.dart';
import 'package:flowery_e_commerce/features/cart/domain/use_cases/update_product_quantity_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import 'cart_base_action.dart';

part 'cart_view_model_state.dart';
@injectable
class CartViewModelCubit extends Cubit<CartViewModelState> {
  final AddToCartUseCase addToCartUseCase;
  final GetUserCartDataUseCase getUserCartDataUseCase;
  final UpdateProductQuantityUseCase updateProductQuantityUseCase;
  final RemoveProductFromCartUseCase removeProductFromCartUseCase;
  final ClearUserCartDataUseCase clearUserCartDataUseCase;

  CartViewModelCubit(
    this.addToCartUseCase,
    this.getUserCartDataUseCase,
    this.updateProductQuantityUseCase,
    this.removeProductFromCartUseCase,
    this.clearUserCartDataUseCase,
  ) : super(CartViewModelInitial());
  final cartKey = GlobalKey<CartIconKey>();
  bool cartVisibility = false;
  Function(GlobalKey)? addToCartAnimation;
  int cartQuantityItems = 0;

  Future<void> doAction(CartBaseAction action) async {
    switch (action) {
      case AddToCartAction():
      return  _addToCart(action);
      case GetUserCartDataAction():
        _getCartData();
      case UpdateQuantityAction():
      // TODO: Handle this case.
      case ClearCartAction():
      // TODO: Handle this case.
      case RemoveFromCartAction():
      // TODO: Handle this case.
    }
  }

  Future<void> _addToCart(AddToCartAction action) async {
    emit(CartViewModelLoading());
    var result = await addToCartUseCase(productId: action.productId);
    switch (result) {
      case Success<int>():
        cartQuantityItems = result.data.toInt();
        updateCartCount();
        cartVisibility = true;

        emit(
          AddProductToCartSuccess(
              visibility: cartVisibility, numOfCartItems: cartQuantityItems),
        );
      case Fail<int>():
        emit(CartViewModelError(
            errorModel: ErrorHandler.handle(result.exception!)));
        break;
    }
  }
  Future<void> _getCartData() async {
    emit(CartViewModelLoading());
    var result = await getUserCartDataUseCase();
    switch (result) {

      case Success<CartEntity>():
      cartVisibility = true;
      cartQuantityItems = result.data.numOfCartItems;
      updateCartCount();
      emit(
        GetUserCartDataSuccess(
             cartData: result.data),
      );
     break;
      case Fail<CartEntity>():
      emit(CartViewModelError(
          errorModel: ErrorHandler.handle(result.exception!)));
      break;
    }
  }

  void updateCartCount() {
    if (cartKey.currentState != null) {
      cartKey.currentState!.runCartAnimation(
        cartQuantityItems.toString(),
      );
    }
  }

}
