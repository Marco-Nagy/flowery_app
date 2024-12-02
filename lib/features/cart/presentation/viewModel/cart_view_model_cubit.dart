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
  late int cartQuantityItems;
 late CartEntity cartData;
  Future<void> doAction(CartBaseAction action) async {
    switch (action) {
      case AddToCartAction():
      return  _addToCart(action);
      case GetUserCartDataAction():
        _getCartData();
      case UpdateQuantityAction():
        _updateProductQuantity(action);
      case RemoveFromCartAction():
        _removeProductFromCart(action);
      case ClearCartAction():
      

    }
  }

  Future<void> _addToCart(AddToCartAction action) async {
    emit(CartViewModelLoading());
    var result = await addToCartUseCase(productId: action.productId);
    switch (result) {
      case Success<int>():

     await   cartKey.currentState!
            .runCartAnimation(result.data.toString());
        cartQuantityItems = result.data;
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
      if(cartKey.currentState!= null) {
        cartKey.currentState!
          .runCartAnimation(result.data.numOfCartItems.toString());
      }
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

  Future<void> _updateProductQuantity(UpdateQuantityAction action) async {
    emit(CartViewModelLoading());
    var result = await updateProductQuantityUseCase(
        id: action.productId, quantity: action.quantity);
    switch (result) {
      case Success<CartEntity>():
        debugPrint('cart quantity : ${result.data.cartList.map((e) => e.quantity,)}');
        emit(
          UpdateCartProductQuantitySuccess(cartData: result.data),
        );

      case Fail<CartEntity>():
        emit(CartViewModelError(
            errorModel: ErrorHandler.handle(result.exception!)));
    }
  }
  Future<void> _removeProductFromCart(RemoveFromCartAction action) async {
    emit(CartViewModelLoading());
    var result = await removeProductFromCartUseCase(id: action.productId);
    switch (result) {
      case Success<CartEntity>():
        _getCartData();
        emit(
          RemoveProductFromCartSuccess(cartData: result.data),
        );
      case Fail<CartEntity>():
        emit(CartViewModelError(
            errorModel: ErrorHandler.handle(result.exception!)));
    }
  }

  void updateCartCount(cartQuantityItems) {

    if (cartKey.currentState != null) {
      cartKey.currentState!.runCartAnimation(
        cartQuantityItems.toString(),
      );
    }
  }
}
