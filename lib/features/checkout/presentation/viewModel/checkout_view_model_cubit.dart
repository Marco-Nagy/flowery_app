import 'package:bloc/bloc.dart';
import 'package:flowery_e_commerce/features/address/domain/entities/response/SavedAddressResponseEntity.dart';
import 'package:flowery_e_commerce/features/checkout/presentation/viewModel/checkout_base_action.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

part 'checkout_view_model_state.dart';

@injectable
class CheckoutViewModelCubit extends Cubit<CheckoutViewModelState> {
  CheckoutViewModelCubit() : super(CheckoutViewModelInitial());
  late GetSavedAddressesEntity currentAddress ;
   int selectedIndex =-1;
  String selectedValue = 'Credit card';

  Future<void> doAction(CheckoutBaseAction action) async {
    switch (action) {
      case SelectAddressAction():
        _selectAddress(action.address, action.index);
        break;
      case SelectPaymentOptionAction():
       _onPaymentOptionSelected(action.option);
    }
  }

void _selectAddress(GetSavedAddressesEntity request,int index) async {
    selectedIndex = index;
   currentAddress = request;
    debugPrint("_selectAddress : $currentAddress");
    debugPrint("_selectAddress : ${currentAddress.street}");
    debugPrint("_selectAddress : ${currentAddress.city}");
    debugPrint("_selectAddress : ${currentAddress.phone}");
    emit(AddShippingAddress());
  }
  Future<String> _onPaymentOptionSelected(String value)async {
    debugPrint("_onPaymentOptionSelected : $value");
    debugPrint("_onPaymentOptionSelected : $selectedValue");
    emit(SelectPaymentOption());
return  selectedValue =await value;
  }
}
