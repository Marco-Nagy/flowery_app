import 'package:bloc/bloc.dart';
import 'package:flowery_e_commerce/features/address_details/domain/entities/request/add_address_request_entity.dart';
import 'package:flowery_e_commerce/features/checkout/presentation/viewModel/checkout_base_action.dart';
import 'package:meta/meta.dart';

part 'checkout_view_model_state.dart';

class CheckoutViewModelCubit extends Cubit<CheckoutViewModelState> {
  CheckoutViewModelCubit() : super(CheckoutViewModelInitial());
  late AddAddressRequestEntity currentAddress;
  Future<void> doAction(CheckoutBaseAction action) async {
    switch (action) {
      case SelectAddressAction():
        _selectAddress(action.address);
        break;
    }
  }

void _selectAddress(AddAddressRequestEntity request) async {
   currentAddress = request;
    emit(AddShippingAddress());
  }
}
