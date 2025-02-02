import 'package:bloc/bloc.dart';
import 'package:flowery_e_commerce/core/networking/common/api_result.dart';
import 'package:flowery_e_commerce/core/networking/error/error_handler.dart';
import 'package:flowery_e_commerce/core/networking/error/error_model.dart';
import 'package:flowery_e_commerce/core/services/firebase_notification/messaging_helper.dart';
import 'package:flowery_e_commerce/features/address/domain/entities/response/SavedAddressResponseEntity.dart';
import 'package:flowery_e_commerce/features/checkout/domain/entities/cash_place_order_entity.dart';
import 'package:flowery_e_commerce/features/checkout/domain/entities/credit_place_order_entity.dart';
import 'package:flowery_e_commerce/features/checkout/domain/use_cases/cash_use_case.dart';
import 'package:flowery_e_commerce/features/checkout/domain/use_cases/credit_use_case.dart';
import 'package:flowery_e_commerce/features/checkout/presentation/viewModel/checkout_base_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

part 'checkout_view_model_state.dart';

@injectable
class CheckoutViewModelCubit extends Cubit<CheckoutViewModelState> {
  final CashUseCase _cashUseCase;
  final CreditUseCase _creditUseCase;

  CheckoutViewModelCubit(this._cashUseCase, this._creditUseCase)
      : super(CheckoutViewModelInitial());
  late AddressesEntity currentAddress;
  int selectedAddress =-1;
  String paymentOption = '';

  Future<void> doAction(CheckoutBaseAction action) async {
    switch (action) {
      case SelectAddressAction():
        _selectAddress(action.address, action.index);
        break;
      case SelectPaymentOptionAction():
       _onPaymentOptionSelected(action.option);
      case CheckoutAction():
        if(paymentOption=='cash') {
          return onCashPaymentSelected();
        }else {
          return onCreditCardPaymentSelected();
        }
    }
  }

  void _selectAddress(AddressesEntity request, int index) async {
    selectedAddress = index;
   currentAddress = request;
    emit(AddShippingAddress());
  }

  void _onPaymentOptionSelected(String value) async {
    paymentOption = await value;
    emit(SelectPaymentOption());
  }

  Future<void> onCashPaymentSelected() async {
    emit(CheckoutLoading());
    emit(CheckoutLoading());
    var result = await _cashUseCase(currentAddress);
    switch(result) {
      case Success<CashPlaceOrderEntity>():
        MessagingHelper().subscribeToTopic(result.data.orderId);
        emit(CheckoutCashSuccess(placeOrder:result.data));
      case Fail<CashPlaceOrderEntity>():
        emit(CheckoutError(error: ErrorHandler.handle(result.exception!)));
    }
  
  }

  Future<void> onCreditCardPaymentSelected() async {
    emit(CheckoutLoading());
    var result = await _creditUseCase(currentAddress);
    switch(result) {
      case Success<CreditPlaceOrderEntity>():
        MessagingHelper().subscribeToTopic(result.data.orderId);
        emit(CheckoutCreditSuccess(placeOrder:result.data));
      case Fail<CreditPlaceOrderEntity>():
        emit(CheckoutError(error: ErrorHandler.handle(result.exception!)));
    }
  }
}
